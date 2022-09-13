import 'package:arretadas/app/modules/alert/domain/errors/errors.dart';
import 'package:arretadas/app/modules/alert/domain/repositories/alert_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAlertUsecase {
  Future<Either<AlertException, String>> call(AlertParams params);
}

class AlertUsecase implements IAlertUsecase {
  final AlertRepository repository;

  AlertUsecase(this.repository);

  @override
  Future<Either<AlertException, String>> call(AlertParams params) async {
    if (params.userId.isEmpty) {
      return Left(AlertException('Usuário inválido'));
    }
    if (params.latitude.isEmpty) {
      return Left(AlertException('Latitude inválida'));
    }
    if (params.longitude.isEmpty) {
      return Left(AlertException('Longitude inválida'));
    }
    if (params.date.isEmpty) {
      return Left(AlertException('Data inválida'));
    }
    if (params.hour.isEmpty) {
      return Left(AlertException('Hora inválida'));
    }
    return await repository.sendAlert(params);
  }
}

class AlertParams {
  final String userId;
  final String token;
  final String latitude;
  final String longitude;
  final String date;
  final String hour;

  AlertParams(
      {required this.userId,
      required this.token,
      required this.latitude,
      required this.longitude,
      required this.date,
      required this.hour});
}
