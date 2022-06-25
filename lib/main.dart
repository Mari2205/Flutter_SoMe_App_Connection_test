import 'package:flutter/material.dart';
import 'package:flutter_onlypants_h4_signalr_test/screens/screens.dart';
import 'models/message_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(
        messageData: MessageData(
          senderName: 'me',
          message: 'hert',
          messageDate: DateTime.now(),
          dateMessage: 'epkf',
          profilePicture: 'efe',
        ),
      ),
    );
  }
}
