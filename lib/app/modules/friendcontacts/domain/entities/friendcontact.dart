import 'dart:convert';

class Friendcontact {
  String id;
  String name;
  String number;

  Friendcontact({required this.id, required this.name, required this.number});

  factory Friendcontact.empty() => Friendcontact(id: '', name: '', number: '');

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'number': number,
    };
  }

  factory Friendcontact.fromMap(Map<String, dynamic> map) {
    return Friendcontact(
      id: map['_id'],
      name: map['name'],
      number: map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Friendcontact.fromJson(String source) =>
      Friendcontact.fromMap(json.decode(source));
}
