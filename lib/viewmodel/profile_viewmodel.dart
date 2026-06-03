import 'package:flutter/material.dart';
import 'package:flutter_practice_application/view/login_view.dart';

class ProfileViewModel extends ChangeNotifier {
  bool isHidden = true;
  bool isDark = false;
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;

  void toggleUserData() {
    isHidden = !isHidden;
    notifyListeners();
  }

  void logout(BuildContext context) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));

  void toggleTheme() {
    isDark = !isDark;

    backgroundColor = isDark ? Colors.black : Colors.white;
    textColor = isDark ? Colors.white : Colors.black;

    notifyListeners();
  }
}