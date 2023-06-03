import 'package:scholar_chat/constants.dart';

class Message {
  final String textMessage;

  Message(this.textMessage);

  factory Message.fromJson(jsonData){
    return Message(jsonData[kMessage]) ;
  }

}