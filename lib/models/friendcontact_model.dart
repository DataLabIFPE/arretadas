import 'dart:convert';

class FriendContactModel {
  String id;
  String name;
  String number;

  FriendContactModel({this.id, this.name, this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }

  factory FriendContactModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FriendContactModel(
      id: map['id'],
      name: map['name'],
      number: map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FriendContactModel.fromJson(String source) =>
      FriendContactModel.fromMap(json.decode(source));
}
