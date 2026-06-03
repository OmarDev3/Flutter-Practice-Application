class QuotesModel {
  final String quoteText;
  final String author;

  QuotesModel({required this.quoteText, required this.author});

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(quoteText: json['quote'], author: json['author']);
}