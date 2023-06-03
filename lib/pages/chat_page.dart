import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/model/message.dart';

import '../widgets/chat_buble.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  ChatPage({super.key});
  TextEditingController controller = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: messages.get(),
      builder: (context, snapshot) {
        List<Message> messagesLists = [];
        for (var i = 0; i < snapshot.data!.docs.length; i++) {
          messagesLists.add(Message.fromJson(snapshot.data!.docs[i]));
        }
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    klogo,
                    height: 50,
                  ),
                  const Text('chat'),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messagesLists.length,
                    itemBuilder: (context, index) {
                    return chatBuble(message: messagesLists[index],);
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({'message': data});
                      controller.clear();
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffix: Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('loding');
        }
      },
    );
  }
}
