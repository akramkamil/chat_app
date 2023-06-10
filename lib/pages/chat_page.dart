import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/model/message.dart';
import 'package:scholar_chat/widgets/chat_buble.dart';


// ignore: must_be_immutable
class ChatPage extends StatefulWidget {
  static String id = 'ChatPage';

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  final ScrollController _controller =ScrollController();
  @override
  Widget build(BuildContext context) {
   var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt',descending: true).snapshots(),
      builder: (context, snapshot) {

        if (snapshot.hasData) {
                  List<Message> messagesLists = [];

        for (var i = 0; i < snapshot.data!.docs.length; i++) {
          messagesLists.add(Message.fromJson(snapshot.data!.docs[i]));
        }
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
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesLists.length,
                    itemBuilder: (context, index) {
                    return messagesLists[index].id == email ?
                     ChatBuble(message: messagesLists[index])
                     : ChatFriendBuble(message: messagesLists[index]);
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add({
                        'message': data, 
                        'createdAt': DateTime.now(),
                        'id': email
                        });
                      controller.clear();
                      _controller.animateTo(
                        0,
                        duration: const Duration(seconds: 2), 
                        curve: Curves.easeIn
                        );
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      suffix: const Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
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
          return Text('loading...');
          }
      },
    );
  }
}
