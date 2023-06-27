  class MemberModel {
  int id;
  String fullName;
  String profileUrl;
  String profileImageUrl;
  bool isOnline;
  bool showOnlineStatus;
  bool isBlocked;
  bool isContact;
  bool isDeleted;
  MemberModel({
    required this.id,
    required this.fullName,
    required this.profileUrl,
    required this.profileImageUrl,
    required this.isOnline,
    required this.showOnlineStatus,
    required this.isBlocked,
    required this.isContact,
    required this.isDeleted
  });
  factory MemberModel.fromJsonMap(Map<String, dynamic> json) => MemberModel(
    id:json["id"],
    fullName:json["fullname"],
    profileUrl:json["profileurl"],
    profileImageUrl:json["profileimageurl"],
    isOnline:json["isonline"],
    showOnlineStatus:json["showonlinestatus"],
    isBlocked:json["isblocked"],
    isContact:json["iscontact"],
    isDeleted:json["isdeleted"]
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullName,
        "profileurl": profileUrl,
        "profileimageurl": profileImageUrl,
        "isonline": isOnline,
        "showonlinestatus": showOnlineStatus,
        "isblocked": isBlocked,
        "iscontact": isContact,
        "isdeleted": isDeleted
    };
}