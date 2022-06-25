import 'package:signalr_core/signalr_core.dart';

class SignalrConnection {
  Future Connection() async {
    final connection = HubConnectionBuilder()
        .withUrl(
            'http://10.0.2.2:5238/chathub',
            HttpConnectionOptions(
              logging: (level, message) =>
                  print('Test message ${message.toString()}'),
            ))
        .build();

    await connection.start();

    connection.on('ReceiveMessage', (message) {
      print(" ${message.toString()}");
    });

    await connection.invoke('SendMessage', args: ['flutter', 'hallo']);
  }
}
