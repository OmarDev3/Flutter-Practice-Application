import 'package:flutter/material.dart';
import 'package:flutter_practice_application/view/quotes_view.dart';
import 'package:flutter_practice_application/viewmodel/notes_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice_application/view/profile_view.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final notesViewModel = Provider.of<NotesViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Notes"), centerTitle: true, backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsetsGeometry.only(top: 50),
              child: Column(
                children: [
                  Form(
                    key: notesViewModel.noteForm,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: notesViewModel.task, validator: (value) => value == null || value.isEmpty ? "Enter the task" : null,
                          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), hintText: "Enter the task", labelText: "Task")
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(onPressed: () => notesViewModel.addNote(), child: Text("Add Task", style: TextStyle(fontSize: 20))),
                        Divider(),
                        SizedBox(height: 10),
                        notesViewModel.notes.isEmpty ? Text("") : Text("Tasks", style: TextStyle(fontSize: 25)),
                        SizedBox(height: 10),
                        ListView.builder(
                          controller: ScrollController(), shrinkWrap: true, itemCount: notesViewModel.notes.length,
                          itemBuilder: (context, index) {
                            final task = notesViewModel.notes[index];
                            return Card(child: ListTile(title: Text(task.note), trailing: IconButton(onPressed: () => notesViewModel.deleteNote(task.id), icon: Icon(Icons.delete))));
                          }
                        )
                      ]
                    )
                  )
                ]
              )
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
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileView())),
                  icon: Icon(Icons.person), iconSize: 30, color: Colors.grey
                ),
                Text("Profile")
              ]
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [IconButton(onPressed: () {}, icon: Icon(Icons.note), iconSize: 30, color: Colors.black), Text("Notes")]
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuotesView())), icon: Icon(Icons.text_snippet), iconSize: 30,
                  color: Colors.grey,
                ),
                Text("Quotes")
              ],
            )
          ]
        )
      )
    );
  }
}