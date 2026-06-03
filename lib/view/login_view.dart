import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice_application/viewmodel/auth_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Login"), centerTitle: true, backgroundColor: Colors.white),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Form(
                key: authViewModel.loginFormKey,
                child: Column(
                  children: [
                    Icon(Icons.lock, size: 40, color: Theme.of(context).iconTheme.color),

                    SizedBox(height: 20),

                    TextFormField(
                      style: TextStyle(color: Theme.of(context).textTheme.labelSmall!.color),
                      controller: authViewModel.emailController, keyboardType: TextInputType.emailAddress,
                      validator: (value) => value == null || value.isEmpty ? "Enter your email" : !value.contains("@") ? "Invalid email" : null,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)), labelText: "Email", hintText: "example@email.com")
                    ),

                    SizedBox(height: 30),
                    
                    TextFormField(
                      style: TextStyle(color: Theme.of(context).textTheme.labelSmall!.color),
                      controller: authViewModel.passwordController, validator: (value) => value == null || value.isEmpty ? "Enter your password" : value.length < 6 ? "Password too short" : null,
                      obscureText: authViewModel.isObsecured,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => authViewModel.togglePasswordVisibility(),
                          icon: authViewModel.isObsecured ? Icon(Icons.visibility) : Icon(Icons.visibility_off)
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)), labelText: "Password", hintText: "Password"
                      )
                    ),

                    SizedBox(height: 40),

                    SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)), backgroundColor: Colors.blue),
                        onPressed: () => authViewModel.loginValidation(context), child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white))
                      )
                    )
                  ]
                )
              )
            )
          )
        )
      )
    );
  }
}