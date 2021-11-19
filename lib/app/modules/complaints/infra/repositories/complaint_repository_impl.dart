import 'package:arretadas/app/modules/complaints/domain/entities/complaint.dart';
import 'package:arretadas/app/modules/complaints/domain/erros/erros.dart';
import 'package:arretadas/app/modules/complaints/domain/repositories/complaint_repository.dart';
import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';
import 'package:arretadas/app/modules/complaints/infra/datasources/complaint_datasource.dart';
import 'package:fpdart/fpdart.dart';

class ComplaintRepositoryImpl implements ComplaintRepository {
  final ComplaintDatasource datasource;

  ComplaintRepositoryImpl(this.datasource);

  @override
  Future<Either<ComplaintException, Complaint>> sendComplaint(
      ComplaintParams params) async {
    try {
      final response = await datasource.sendComplaint(params);
      return Right(response);
    } on ComplaintException catch (e) {
      return Left(e);
    }
  }
}
