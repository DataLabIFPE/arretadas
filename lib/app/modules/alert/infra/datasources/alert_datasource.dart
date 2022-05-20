import 'package:arretadas/app/modules/alert/domain/usecases/alert_usecase.dart';

abstract class AlertDatasource {
  Future<String> sendAlert(AlertParams params);
}
