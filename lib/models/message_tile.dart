import 'package:meta/meta.dart';

@immutable
class MessageTile {
  MessageTile({
    required this.message,
    required this.messageDate,
  });

  final String message;
  final String messageDate;
}
