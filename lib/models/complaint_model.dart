import 'dart:convert';

class ComplaintModel {
  String id;
  String latitude;
  String longitude;
  String date;
  String hour;
  // ignore: non_constant_identifier_names
  String type_complaint;

  ComplaintModel(
      {this.id,
      this.latitude,
      this.longitude,
      this.date,
      this.hour,
      // ignore: non_constant_identifier_names
      this.type_complaint});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'date': date,
      'hour': hour,
      'type_complaint': type_complaint,
    };
  }

  factory ComplaintModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ComplaintModel(
      id: map['id'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      date: map['date'],
      hour: map['hour'],
      type_complaint: map['type_complaint'].join(''),
    );
  }

  String toJson() => json.encode(toMap());

  factory ComplaintModel.fromJson(String source) =>
      ComplaintModel.fromMap(json.decode(source));
}
