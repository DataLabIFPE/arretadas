import 'package:arretadas/app/modules/alert/domain/errors/errors.dart';
import 'package:arretadas/app/modules/alert/domain/usecases/alert_usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract class AlertRepository {
  Future<Either<AlertException, String>> sendAlert(AlertParams params);
}
