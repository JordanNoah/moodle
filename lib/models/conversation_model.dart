import 'member_model.dart';
import 'message_model.dart';

class ConversationModel{
  int id;
  List<MemberModel> members;
  List<MessageModel> messages;
  
  ConversationModel({
    required this.id,
    required this.members,
    required this.messages
  });

  factory ConversationModel.fromJsonMap(Map<String, dynamic> json) => ConversationModel(
    id: json["id"], 
    members: List<MemberModel>.from(json["members"].map((x) => MemberModel.fromJsonMap(x))),
    messages: List<MessageModel>.from(json["messages"].map((x) => MessageModel.fromJsonMap(x)))
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
    };
}