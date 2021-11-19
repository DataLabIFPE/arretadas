import 'package:arretadas/app/modules/complaints/domain/entities/complaint.dart';
import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';

abstract class ComplaintDatasource {
  Future<Complaint> sendComplaint(ComplaintParams params);
}
