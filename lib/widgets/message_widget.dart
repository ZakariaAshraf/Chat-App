import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
   MessageWidget({Key? key, this.messageSender, this.text, required this.isMe}) : super(key: key);
   final String? messageSender;
   final String ? text;
   final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ?CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text("$messageSender",style: TextStyle(
            color: isMe ?const Color(0xffec0f0f) : const Color(0xff90a285)
          ),),
          Material(
            elevation: 4,
            borderRadius: isMe ?const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ):const BorderRadius.only(
              bottomRight: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            color: const Color(0xff173b02),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  '$text ',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
