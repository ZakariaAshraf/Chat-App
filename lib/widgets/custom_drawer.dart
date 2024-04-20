import 'package:chatapp/screens/setting_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screens/welcome_screen.dart';

class CustomDrawer extends StatefulWidget {
   CustomDrawer({Key? key,this.onClick}) : super(key: key);
  final Function ?onClick;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _auth = FirebaseAuth.instance;

  late User signedInUser;

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Drawer(
      width: mediaQuery.size.width * 0.8,
      backgroundColor: Colors.white,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: Center(
                    child: Icon(
                  Icons.message,
                  color: Colors.blueAccent,
                  size: 50,
                )),
              ),
              const SizedBox(height: 50,),
              //Home
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Text("H O M E "),
                  leading: Icon(CupertinoIcons.home,color: Colors.blueAccent,),
                ),
              ),
              //settings
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  onTap: () => Navigator.pushNamed(context, SettingView.RouteName),
                  title: Text("S E T T I N G S"),
                  leading: Icon(CupertinoIcons.settings,color: Colors.blueAccent,),
                ),
              ),
            ],
          ),
          //logout
           Padding(
            padding: EdgeInsets.only(left: 20.0,bottom: 30,),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout_outlined,color: Colors.blueAccent,),
              onTap:() {
                _auth.signOut();
                Navigator.popAndPushNamed(context, WelcomScreen.RouteName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
