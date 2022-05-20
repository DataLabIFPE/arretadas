import 'package:arretadas/app/core/adapter.dart';
import 'package:arretadas/app/modules/alert/domain/errors/errors.dart';
import 'package:arretadas/app/modules/alert/domain/usecases/alert_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AlertStore extends NotifierStore<AlertException, String> {
  final IAlertUsecase alertUsecase;

  AlertStore(this.alertUsecase) : super('');

  void sendAlert(AlertParams params) {
    executeEither(() => EitherAdapterImpl.adapter(alertUsecase(params)));
  }
}
