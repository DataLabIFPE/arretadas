import 'package:latlong2/latlong.dart';

class Complaint {
  late List<String>? tipoViolencia;
  late String data;
  late String hora;
  late LatLng? local;

  Complaint({this.tipoViolencia, this.data = '', this.hora = '', this.local});

  Complaint copyWith({
    List<String>? tipoViolencia,
    String? data,
    String? hora,
    LatLng? local,
  }) {
    return Complaint(
      tipoViolencia: tipoViolencia ?? this.tipoViolencia,
      data: data ?? this.data,
      hora: hora ?? this.hora,
      local: local ?? this.local,
    );
  }
}
