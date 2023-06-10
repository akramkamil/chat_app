import 'package:scholar_chat/constants.dart';

class Message {
  final String textMessage;
  final String id;
  Message(this.textMessage, this.id);

  factory Message.fromJson(jsonData){
    return Message(jsonData[kMessage], jsonData['id']) ;
  }

}