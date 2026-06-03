import 'package:flutter/material.dart';
import 'package:flutter_practice_application/model/note_model.dart';

class NotesViewModel extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  final noteForm = GlobalKey<FormState>();
  final task = TextEditingController();

  int _idCounter = 0;

  NotesViewModel() {
    _tasksData();
  }

  @override
  void dispose() {
    task.dispose();
    super.dispose();
  }

  void _tasksData() {
    _notes.addAll([NoteModel(id: 1, note: 'Reading book'), NoteModel(id: 2, note: 'Do the work'), NoteModel(id: 3, note: 'Clean my room')]);
  }

  void addNote() {
    if(noteForm.currentState!.validate()) {
      final text = task.text.trim();
      if (text.isEmpty) return;
      _notes.add(NoteModel(id: _idCounter++, note: text));
      notifyListeners();
      clearInput();
    }
  }

  void deleteNote(int id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  void clearInput() => task.clear();
}