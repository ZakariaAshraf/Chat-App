import 'package:chatapp/screens/register_screen.dart';
import 'package:chatapp/screens/sign_in_screen.dart';
import 'package:chatapp/widgets/custom_matrial_button.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatelessWidget {
  WelcomScreen({Key? key}) : super(key: key);
  static String RouteName = "Welcome Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/chatlogo.png",
                fit: BoxFit.cover,
              ),
              Text(
                "Chat Chat",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              CustomMatrialButton(color: Colors.blue , text: "Sign In", onClick:(){
                Navigator.pushNamed(context,SignIn.RouteName,);
              } ),
              CustomMatrialButton(color: Colors.blue, text: "Register", onClick:(){
                Navigator.pushNamed(context,Register.RouteName,);

              } )
            ],
          )
        ],
      ),
    );
  }
}
