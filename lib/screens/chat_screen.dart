import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../mock/mock_data.dart';
import '../utils/utils.dart';
import '../models/models.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        // leadingWidth: 10000,
        title: _AppBarTitle(
          messageData: messageData,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _DemoMessageList(),
          ),
          const _ActionBar(),
        ],
      ),
    );
  }
}

class _DemoMessageList extends StatelessWidget {
  _DemoMessageList({Key? key}) : super(key: key);

  final List<MessageTile> messages = MokeData().messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: ListView(
        children: [
          const _DateLable(lable: 'Yesterday'),
          _MessageTile(
            messageTile: messages[0],
          ),
          _MessageOwnTile(
            messageTile: messages[1],
          ),
          _MessageTile(
            messageTile: messages[2],
          ),
          _MessageOwnTile(
            messageTile: messages[3],
          ),
          _MessageTile(
            messageTile: messages[4],
          ),
          _MessageOwnTile(
            messageTile: messages[5],
          ),
        ],
      ),
    );
  }
}

const _borderRadius = 26.0;

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    Key? key,
    required this.messageTile,
  }) : super(key: key);

  final MessageTile messageTile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(_borderRadius),
                topRight: Radius.circular(_borderRadius),
                bottomRight: Radius.circular(_borderRadius),
              ),
            ),
            child: _TextPaddingMessageTile(
                messageTile.message, const Color.fromARGB(255, 72, 72, 72)),
          ),
          _DatePaddingMessageTile(messageTile.messageDate)
        ],
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  _MessageOwnTile({
    Key? key,
    required this.messageTile,
  }) : super(key: key);

  final MessageTile messageTile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight, // diff
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end, // diff
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue, // diff
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_borderRadius), // diff
                bottomRight: Radius.circular(_borderRadius), // diff
                bottomLeft: Radius.circular(_borderRadius), // diff
              ),
            ),
            child: _TextPaddingMessageTile(messageTile.message, Colors.white),
          ),
          _DatePaddingMessageTile(messageTile.messageDate)
        ],
      ),
    );
  }
}

Padding _TextPaddingMessageTile(String message, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
    child: Text(
      message,
      style: TextStyle(
        color: color,
      ),
    ),
  );
}

Padding _DatePaddingMessageTile(String messageDate) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Text(
      messageDate,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

class _DateLable extends StatelessWidget {
  const _DateLable({
    Key? key,
    required this.lable,
  }) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: Text(
              lable,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    Key? key,
    required this.messageData,
  }) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(CupertinoIcons.profile_circled),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                messageData.senderName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                'Online now',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: true,
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'type something...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 10,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
              ),
              child: const Text("Click"),
              onPressed: () {
                print('TODO send messages');
                final data = SignalrConnection();
                data.Connection();
              },
              // onPressed: () => Navigator.push(
              //   context,
              //   MaterialPageRoute<void>(
              //     builder: (context) => StreamConnection(),),)
            ),
          ),
        ],
      ),
    );
  }
}
