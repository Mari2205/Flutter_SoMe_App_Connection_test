import 'package:signalr_core/signalr_core.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/material.dart';

// class SignalrConnection2 {
// Future Connection() async {
//   final connection = HubConnectionBuilder()
//       .withUrl(
//           'ws://10.0.2.2:5238/chathub',
//           HttpConnectionOptions(
//             logging: (level, message) =>
//                 print('Test message ${message.toString()}'),
//           ))
//       .build();

//   await connection.start();

//   connection.on('ReceiveMessage', (message) {
//     print(" ${message.toString()}");
//   });

//   await connection.invoke('SendMessage', args: ['flutter', 'hallo']);
// }

//   late HubConnection connection;
//   static const String url = 'http://10.0.2.2:5238/chathub'; // https | ws | wss

//   SignalrConnection() {
//     connection = HubConnectionBuilder()
//         .withUrl(
//             url,
//             HttpConnectionOptions(
//                 logging: (level, message) =>
//                     print('test message ${message.toString()}')))
//         .withAutomaticReconnect()
//         .build();

//     _StartConnection();
//   }

//   Future _StartConnection() async {
//     connection.start();
//     await connection.state == 'Connected';
//   }

//   Future ReceiveMessage() async {
//     connection.on('ReceiveMessage', (message) {
//       print('Receive message is : ${message.toString()}');
//     });
//   }

//   Future SendMessage(String senderName, String message) async {
//     await connection.invoke('SendMessage', args: [senderName, message]);
//   }
// }

// class StreamConnection2 extends StatelessWidget {
//   StreamConnection2({Key? key}) : super(key: key);
//   //'http://10.0.2.2:5238/chathub'
//   final uri = Uri(port: 5238, host: '10.0.2.2', scheme: 'http');

//   @override
//   Widget build(BuildContext context) {
//     final channel = WebSocketChannel.connect(uri);
//     return StreamBuilder(
//       stream: channel.stream,
//       builder: (context, snapshot) {
//         var data = context;
//         print('tester : $context | $snapshot');
//         return const CircularProgressIndicator(
//           color: Colors.amber,
//         );
//       },
//     );
//   }
// }

class StreamSignalr extends StatelessWidget {
  StreamSignalr({Key? key}) : super(key: key);

  static const String url = 'http://10.0.2.2:5238'; // https | ws | wss

  final connection = HubConnectionBuilder()
      .withUrl(
          url,
          HttpConnectionOptions(
              logging: (level, message) => print(
                  'test message ${message.toString()}')))
      .build();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: connection.stream('/chathub'),
      builder: (context, snapshot) {
        print('tester : $context, $snapshot');
        return const CircularProgressIndicator(
          color: Colors.amber,
        );
      },
    );
  }
}
