import 'dart:async';

import 'package:chatapp/service/chat_service.dart';
import 'package:chatapp/widgets/custom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/message_widget.dart';
late User signedInUser;
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static String RouteName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? messageText;

  final _auth = FirebaseAuth.instance;

  final _firestore = FirebaseFirestore.instance;

  final messageTextController = TextEditingController();
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
  //
  // void getUserStream() async {
  //   await for (var snapshot in _firestore.collection('messages').snapshots()) {
  //     for (var snapshot in snapshot.docs) {
  //       print(snapshot.data());
  //     }
  //   }
  // }

  // void getMessages()async {
  //   final messages = await _firestore.collection('messages').get();
  //     for(var message in messages.docs) {
  //       print(message.data());
  //     }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Chat Me"),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       getUserStream();
        //     },
        //     icon: Icon(
        //       CupertinoIcons.down_arrow,
        //     ),
        //   )
        // ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(),
            Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageTextController,
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 15,
                            ),
                            hintText: "Write your message her...",
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          messageTextController.clear();
                          _firestore.collection('messages').add({
                            'text': messageText,
                            'sender': signedInUser.email,
                            'time':FieldValue.serverTimestamp(),
                          });
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                )],
        ),
      ),
    );
  }

}
class MessageStreamBuilder extends StatelessWidget {
  MessageStreamBuilder({Key? key}) : super(key: key);
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('time').snapshots(),
        builder: (context, snapshot) {

          List<MessageWidget> messagesWidgets = [];
          final messages=snapshot.data!.docs.reversed;


          for(var message in messages){
            final messageText= message.get('text');
            final messageSender = message.get('sender');
            final currentUser=signedInUser.email;
            final messageWidget=MessageWidget(text: messageText,messageSender: messageSender,isMe:currentUser==messageSender,);
           if( currentUser==messageSender){} ;
            messagesWidgets.add(messageWidget);
          }
          //error
          if (snapshot.hasError) {
            return const Text("error ");
          }
          //loding
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("loading... ");
          }
          //return list view
          return Expanded(
            child:ListView(
              reverse: true,
              padding: EdgeInsets.all(5),
              children: messagesWidgets,
            ),
          );

        },
      ),
    );

  }
}



