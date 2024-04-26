import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/home_screen.dart';
import 'package:chatapp/screens/register_screen.dart';
import 'package:chatapp/screens/setting_view.dart';
import 'package:chatapp/screens/sign_in_screen.dart';
import 'package:chatapp/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _auth = FirebaseAuth.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: _auth.currentUser!=null ?HomeScreen.RouteName : WelcomScreen.RouteName,
      routes: {
          WelcomScreen.RouteName:(context) => WelcomScreen(),
        SignIn.RouteName:(context) =>SignIn(),
        Register.RouteName:(context) =>Register(),
        HomeScreen.RouteName:(context) =>HomeScreen(),
        SettingView.RouteName:(context) =>SettingView(),

    },
      builder: EasyLoading.init(),
    );
  }
}



