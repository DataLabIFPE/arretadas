import 'package:arretadas/app/modules/complaints/domain/erros/erros.dart';
import 'package:arretadas/app/modules/complaints/domain/repositories/complaint_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:latlong2/latlong.dart';

abstract class IComplaintUsecase {
  Future<Either<ComplaintException, String>> call(ComplaintParams params);
}

class ComplaintUsecase implements IComplaintUsecase {
  final ComplaintRepository repository;

  ComplaintUsecase(this.repository);

  @override
  Future<Either<ComplaintException, String>> call(
      ComplaintParams params) async {
    return await repository.sendComplaint(params);
  }
}

class ComplaintParams {
  final List<String>? tipoViolencia;
  final String data;
  final String hora;
  final LatLng? local;

  ComplaintParams(
      {required this.tipoViolencia,
      required this.data,
      required this.hora,
      this.local});
}
