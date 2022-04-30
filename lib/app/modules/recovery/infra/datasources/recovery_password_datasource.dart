import '../../domain/usecases/recovery_password_usecase.dart';

abstract class RecoveryPasswordDatasource {
  Future<String> recover(RecoveryPasswordParams params);
}
