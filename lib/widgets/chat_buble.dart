import 'package:flutter/material.dart';
import 'package:scholar_chat/model/message.dart';

import '../constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key, required this.message,
  });
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))),
        child: Text(
          message.textMessage,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


class ChatFriendBuble extends StatelessWidget {
  const ChatFriendBuble({
    super.key, required this.message,
  });
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
            color: Color(0xff006d84),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32))),
        child: Text(
          message.textMessage,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}