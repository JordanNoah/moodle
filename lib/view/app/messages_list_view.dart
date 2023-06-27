import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodle/helpers/get_conversations.dart';
import 'package:moodle/models/conversation_model.dart';
import 'package:moodle/models/conversations_model.dart';
import 'package:moodle/models/member_model.dart';
import 'package:moodle/models/message_model.dart';
import 'package:moodle/view/views.dart';

class MessagesListView extends StatelessWidget {
  static const String name = 'messages_list_view';
  const MessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetConversations().getFullAnswer(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else {
            if (snapshot.hasData) {
              ConversationsModel conversationsSnapshot = snapshot.data;
              return ListView.builder(
                itemCount: conversationsSnapshot.conversations.length,
                itemBuilder: (BuildContext context, int index) {
                  ConversationModel conversation =
                      conversationsSnapshot.conversations[index];
                  MemberModel members = conversation.members.first;
                  MessageModel message = conversation.messages.first;
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              NetworkImage(members.profileImageUrl),
                        ),
                        title: Text(
                          members.fullName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            Text(message.text, overflow: TextOverflow.ellipsis),
                        onTap: () => context.pushNamed(ConversationView.name,
                            pathParameters: {
                              'id': (conversation.id).toString()
                            }),
                      ),
                      const Divider(
                        thickness: 0.2,
                        indent: 10.0,
                        endIndent: 10.0,
                      )
                    ],
                  );
                },
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: Text("No messages found"),
                ),
              );
            }
          }
      },
    );
  }
}