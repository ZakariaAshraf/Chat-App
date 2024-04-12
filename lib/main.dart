import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:chatapp/screens/sign_in_screen.dart';
import 'package:chatapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: WelcomScreen.RouteName,
      routes: {
          WelcomScreen.RouteName:(context) => WelcomScreen(),
        SignIn.RouteName:(context) =>SignIn(),
        Register.RouteName:(context) =>Register(),
        ChatScreen.RouteName:(context) =>ChatScreen(),
    },
    );
  }
}



