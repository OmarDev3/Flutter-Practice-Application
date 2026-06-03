import 'dart:convert';
import 'package:flutter_practice_application/model/quotes_model.dart';
import 'package:http/http.dart' as http;

class QuotesService {
  Future<List<QuotesModel>> getQuote() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/quotes'));
    
    if(response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> quotesJson = responseData['quotes'];

      List<QuotesModel> quotes = [];

      for (var quote in quotesJson) {
        quotes.add(QuotesModel.fromJson(quote));
      }
      
      return quotes;
    }

    return throw Exception('Failed to load quotes');
  }
}