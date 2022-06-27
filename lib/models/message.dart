import 'package:meta/meta.dart';

@immutable
class Message {
  const Message({
    required this.message,
    required this.senderName,
  });

  final String message;
  final String senderName;
}
