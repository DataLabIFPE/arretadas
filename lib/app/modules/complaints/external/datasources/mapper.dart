import 'package:arretadas/app/modules/complaints/domain/entities/complaint.dart';

class ComplaintMapper {
  static Complaint fromJson(Map<String, dynamic> json) {
    return Complaint(
      data: json['data'],
      hora: json['hora'],
      local: json['local'],
      tipoViolencia: json['tipoViolencia'],
    );
  }
}
