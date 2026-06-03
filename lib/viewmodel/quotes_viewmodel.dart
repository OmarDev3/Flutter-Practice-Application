import 'package:flutter/material.dart';
import 'package:flutter_practice_application/model/quotes_model.dart';
import 'package:flutter_practice_application/services/quotes_service.dart';

class QuotesViewModel extends ChangeNotifier {
  final QuotesService quotesService = QuotesService();
  List<QuotesModel> quotesList = [];
  bool isLoading = false;
  String? errorMessage;

  QuotesViewModel() {
    fetchQuote();
  }

  Future<void> fetchQuote() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      quotesList = await quotesService.getQuote();
    } catch (error) {
      errorMessage = error.toString();
    }
    
    isLoading = false;
    notifyListeners();
  }
}