import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice_application/view/profile_view.dart';
import 'package:flutter_practice_application/view/note_view.dart';
import 'package:flutter_practice_application/viewmodel/quotes_viewmodel.dart';

class QuotesView extends StatelessWidget {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final quotesViewModel = Provider.of<QuotesViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Quotes"), centerTitle: true, backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: quotesViewModel.isLoading ? CircularProgressIndicator() : quotesViewModel.errorMessage != null ? Text(quotesViewModel.errorMessage!) :
            ListView.builder(
              controller: ScrollController(), shrinkWrap: true, itemCount: quotesViewModel.quotesList.length,
              itemBuilder: (context, index) {
                final quote = quotesViewModel.quotesList[index].quoteText;
                final author = quotesViewModel.quotesList[index].author;
                return Card(child: ListTile(title: Text(quote), subtitle: Text(author)));
              }
            )
          )
        )
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 55),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileView())), icon: Icon(Icons.person), iconSize: 30,
                  color: Colors.grey
                ),
                Text("Profile")
              ]
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NoteView())), icon: Icon(Icons.note), iconSize: 30,
                  color: Colors.grey
                ),
                Text("Notes")
              ]
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [IconButton(onPressed: () {}, icon: Icon(Icons.text_snippet), iconSize: 30, color: Colors.black), Text("Quotes")]
            )
          ],
        )
      )
    );
  }
}