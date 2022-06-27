// import 'package:signalr_core/signalr_core.dart';

// class SignalrConnection {
//   Future Connection() async {
//     final connection = HubConnectionBuilder()
//         .withUrl(
//             'http://10.0.2.2:5238/chathub',
//             HttpConnectionOptions(
//               logging: (level, message) =>
//                   print('Test message ${message.toString()}'),
//             ))
//         .build();

//     await connection.start();

//     connection.on('ReceiveMessage', (message) {
//       print(" ${message.toString()}");
//     });

//     await connection.invoke('SendMessage', args: ['flutter', 'hallo']);
//   }
// }

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/material.dart';

class StreamConnection extends StatelessWidget {
  StreamConnection({Key? key}) : super(key: key);
  //'http://10.0.2.2:5238/chathub'
  final uri = Uri(port: 5238, host: '10.0.2.2', scheme: 'http');

  @override
  Widget build(BuildContext context) {
    final channel = WebSocketChannel.connect(uri);
    return StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        var data = context;
        print('tester : $context | $snapshot');
        return const CircularProgressIndicator(
          color: Colors.amber,
        );
      },
    );
  }
}
