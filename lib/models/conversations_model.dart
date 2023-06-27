import 'conversation_model.dart';

class ConversationsModel{
  List<ConversationModel> conversations;

  ConversationsModel({
    required this.conversations
  });

  factory ConversationsModel.fromJsonMap(Map<String,dynamic> json) => ConversationsModel(
    conversations: List<ConversationModel>.from(json["conversations"].map((x) => ConversationModel.fromJsonMap(x)))
  );
}