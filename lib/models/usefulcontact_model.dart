import 'dart:convert';

class UsefulcontactModel {
  String id;
  String name;
  String number;

  UsefulcontactModel({this.id, this.name, this.number});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }

  factory UsefulcontactModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UsefulcontactModel(
      id: map['id'],
      name: map['name'],
      number: map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UsefulcontactModel.fromJson(String source) =>
      UsefulcontactModel.fromMap(json.decode(source));
}
