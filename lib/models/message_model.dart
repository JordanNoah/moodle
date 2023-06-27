class MessageModel {
  int id;
  int userIdFrom;
  String text;
  int timeCreated;
  MessageModel({
    required this.id,
    required this.userIdFrom,
    required this.text,
    required this.timeCreated
  });
  factory MessageModel.fromJsonMap(Map<String,dynamic> json) => MessageModel(
    id:json["id"],
    userIdFrom:json["useridfrom"],
    text:json["text"],
    timeCreated:json["timecreated"]
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "useridfrom": userIdFrom,
        "text": text,
        "timecreated": timeCreated
    };
}