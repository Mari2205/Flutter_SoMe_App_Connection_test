import 'package:signalr_core/signalr_core.dart';

class SignalrConnection {
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

  late HubConnection connection;
  static const String url = 'http://10.0.2.2:5238/chathub'; // https | ws | wss

  SignalrConnection() {
    connection = HubConnectionBuilder()
        .withUrl(
            url,
            HttpConnectionOptions(
                logging: (level, message) =>
                    print('test message ${message.toString()}')))
        .withAutomaticReconnect()
        .build();

    // _StartConnection();
  }

  Future _StartConnection() async {
    await connection.start();
  }

  Future ReceiveMessage() async {
    connection.on('ReceiveMessage', (message) {
      print('Receive message is : ${message.toString()}');
    });
  }

  Future SendMessage(String senderName, String message) async {
    await connection.invoke('SendMessage', args: [senderName, message]);
  }
}
