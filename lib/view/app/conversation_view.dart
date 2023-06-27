import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moodle/components/chat/my_message_bubble.dart';
import 'package:moodle/components/chat/not_my_message_bubble.dart';
import 'package:moodle/helpers/get_conversation_message.dart';
import 'package:moodle/models/conversation_model.dart';
import 'package:moodle/models/member_model.dart';
import 'package:moodle/models/message_model.dart';

class ConversationView extends StatelessWidget {
  static const String name = 'conversation_view';
  final String id;
  const ConversationView({super.key,required this.id});

  final idUser = 4;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetConversationMessage().getFullAnswer(id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator(),));
          } else {
            if (snapshot.hasData) {
              ConversationModel conversationSnapshot = snapshot.data;
              List <MemberModel> members = conversationSnapshot.members;
              List<MessageModel> messages = conversationSnapshot.messages;
              return Scaffold(
                appBar: AppBar(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(members.first.fullName,style: const TextStyle(fontSize: 20),),
                      const Text('Online',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                  leadingWidth: 90,
                  leading: InkWell(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BackButton(onPressed: () => context.pop(),),
                      CircleAvatar(
                          backgroundImage: NetworkImage(members.first.profileImageUrl),
                        ),
                    ],
                  ),
                  )
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5,vertical: 0),
                  child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    MessageModel message = messages[index];
                    bool newGroup = false;
                    if (index != 0) {
                      MessageModel messageBefore = messages[index - 1];
                      if (messageBefore.userIdFrom != message.userIdFrom) {
                        newGroup = true;
                      }
                    }else{
                      newGroup = true;
                    }

                    if (idUser == message.userIdFrom ) {
                      return MyMessageBubble(message: message,newGroup: newGroup);
                    }else{
                      return NotMyMessageBubble(message: message,newGroup: newGroup);
                    }
                  },
                ),
                )
              ); 
            }else{
              return const Scaffold(body: Center(child: Text("Empty chat")));
            }
          }
      },
    );
  }
}