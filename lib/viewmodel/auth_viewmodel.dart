import 'package:flutter/material.dart';
import 'package:flutter_practice_application/view/profile_view.dart';

class AuthViewModel extends ChangeNotifier {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  String email = "";
  bool isObsecured = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loadingState(BuildContext context) async {
    showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator(color: Colors.blue)));
    
    await Future.delayed(Duration(seconds: 3));

    if (!context.mounted) return;
    Navigator.pop(context);
  }

  Future<void> loginValidation(BuildContext context) async {
    if(loginFormKey.currentState!.validate()) {
      await loadingState(context);
      if (!context.mounted) return;

      email = emailController.text.trim();
      notifyListeners();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileView()));
      emailController.clear(); passwordController.clear();
    }
  }

  void togglePasswordVisibility() {
    isObsecured = !isObsecured;
    notifyListeners();
  }
} 