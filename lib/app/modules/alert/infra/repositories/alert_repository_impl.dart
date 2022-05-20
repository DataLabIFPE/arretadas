import 'package:arretadas/app/modules/alert/domain/errors/errors.dart';
import 'package:arretadas/app/modules/alert/domain/repositories/alert_repository.dart';
import 'package:arretadas/app/modules/alert/domain/usecases/alert_usecase.dart';
import 'package:arretadas/app/modules/alert/infra/datasources/alert_datasource.dart';
import 'package:fpdart/fpdart.dart';

class AlertRepositoryImpl implements AlertRepository {
  final AlertDatasource datasource;

  AlertRepositoryImpl(this.datasource);

  @override
  Future<Either<AlertException, String>> sendAlert(AlertParams params) async {
    try {
      final response = await datasource.sendAlert(params);
      return Right(response);
    } on AlertException catch (e) {
      return Left(e);
    }
  }
}
