import 'package:flutter/material.dart';
import 'package:flutter_practice_application/view/quotes_view.dart';
import 'package:flutter_practice_application/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice_application/viewmodel/profile_viewmodel.dart';
import 'package:flutter_practice_application/view/note_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile", style: TextStyle(color: profileViewModel.textColor)), centerTitle: true,
        backgroundColor: profileViewModel.isDark ? Colors.grey[900] : Colors.lightBlue
      ),
      backgroundColor: profileViewModel.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CircleAvatar(radius: 50, backgroundImage: AssetImage('images/user-image.png')),

                SizedBox(height: 30),

                Text("Name: ${profileViewModel.isHidden ? "Omar Yusuf" : ""}", style: TextStyle(fontSize: 20, color: profileViewModel.textColor)),

                SizedBox(height: 10),

                Text("Email: ${profileViewModel.isHidden? authViewModel.email : ""}", style: TextStyle(fontSize: 20, color: profileViewModel.textColor)),

                SizedBox(height: 30),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.white),
                  onPressed: () => profileViewModel.toggleUserData(),
                  child: Text(profileViewModel.isHidden ? "Hide Data" : "Show Data", style: TextStyle(color: Colors.black, fontSize: 17))
                ),

                SizedBox(height: 10),
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.white),
                  onPressed: profileViewModel.toggleTheme, child: Text(profileViewModel.isDark ? "Light Mode" : "Dark Mode", style: TextStyle(color: Colors.black, fontSize: 17)),
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Colors.white),
                  onPressed: () => profileViewModel.logout(context), child: Text("Logout", style: TextStyle(color: Colors.black, fontSize: 17))
                )
              ]
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
              children: [IconButton(onPressed: () {}, icon: Icon(Icons.person), iconSize: 30, color: Colors.black), Text("Profile")]
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NoteView())), icon: Icon(Icons.note), iconSize: 30, color: Colors.grey
                ),
                Text("Notes")
              ]
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuotesView())), icon: Icon(Icons.text_snippet),
                  iconSize: 30, color: Colors.grey
                ),
                Text("Quotes")
              ]
            )
          ]
        )
      )
    );
  }
}