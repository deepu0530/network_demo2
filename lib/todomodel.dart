import 'dart:convert';

List<TodoModel> todoModelFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
  TodoModel({
    this.status,
    this.type,
    this.deleted,
    this.id,
    this.user,
    this.text,
    this.v,
    this.source,
    this.updatedAt,
    this.createdAt,
    this.used,
  });

  Status status;
  String type;
  bool deleted;
  String id;
  String user;
  String text;
  int v;
  String source;
  DateTime updatedAt;
  DateTime createdAt;
  bool used;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    status: Status.fromJson(json["status"]),
    type: json["type"],
    deleted: json["deleted"],
    id: json["_id"],
    user: json["user"],
    text: json["text"],
    v: json["__v"],
    source: json["source"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    used: json["used"],
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "type": type,
    "deleted": deleted,
    "_id": id,
    "user": user,
    "text": text,
    "__v": v,
    "source": source,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "used": used,
  };
}

class Status {
  Status({
    this.verified,
    this.sentCount,
    this.feedback,
  });

  bool verified;
  int sentCount;
  String feedback;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    verified: json["verified"],
    sentCount: json["sentCount"],
    feedback: json["feedback"] == null ? null : json["feedback"],
  );

  Map<String, dynamic> toJson() => {
    "verified": verified,
    "sentCount": sentCount,
    "feedback": feedback == null ? null : feedback,
  };
}




