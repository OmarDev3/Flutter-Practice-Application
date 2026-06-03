import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice_application/viewmodel/auth_viewmodel.dart';
import 'package:flutter_practice_application/viewmodel/notes_viewmodel.dart';
import 'package:flutter_practice_application/viewmodel/profile_viewmodel.dart';
import 'package:flutter_practice_application/viewmodel/quotes_viewmodel.dart';
import 'package:flutter_practice_application/view/login_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => NotesViewModel()),
        ChangeNotifierProvider(create: (_) => QuotesViewModel())
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginView());
  }
}