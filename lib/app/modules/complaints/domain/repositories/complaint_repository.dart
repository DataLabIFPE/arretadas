import 'package:arretadas/app/modules/complaints/domain/entities/complaint.dart';
import 'package:arretadas/app/modules/complaints/domain/erros/erros.dart';
import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract class ComplaintRepository {
  Future<Either<ComplaintException, Complaint>> sendComplaint(
      ComplaintParams params);
}
