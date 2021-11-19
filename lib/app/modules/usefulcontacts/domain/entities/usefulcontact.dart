import 'dart:convert';

class Usefulcontact {
  String id;
  String name;
  String number;

  Usefulcontact({required this.id, required this.name, required this.number});

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'number': number,
    };
  }

  factory Usefulcontact.fromMap(Map<String, dynamic> map) {
    return Usefulcontact(
      id: map['_id'],
      name: map['name'],
      number: map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usefulcontact.fromJson(String source) =>
      Usefulcontact.fromMap(json.decode(source));
}
