import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:moodle/models/message_model.dart';

class MyMessageBubble extends StatelessWidget {
  final MessageModel message;
  final bool newGroup;
  const MyMessageBubble({super.key, required this.message,required this.newGroup});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Bubble(
      color: colors.primary,
      margin: BubbleEdges.fromLTRB(0, newGroup ? 5 : 0, 0, 1),
      alignment:Alignment.topRight,
      nip: BubbleNip.rightTop,
      showNip: newGroup,
      child: Text(message.text,textAlign: TextAlign.center, style: const TextStyle(fontSize: 11.0)),
    );
  }
}