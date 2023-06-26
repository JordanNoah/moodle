import 'package:flutter/material.dart';

class MessagesListView extends StatelessWidget {
  static const String name = 'messages_list_view';
  const MessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Messages list view"),
    );
  }
}