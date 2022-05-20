import 'package:arretadas/app/modules/complaints/domain/erros/erros.dart';
import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract class ComplaintRepository {
  Future<Either<ComplaintException, String>> sendComplaint(
      ComplaintParams params);
}
