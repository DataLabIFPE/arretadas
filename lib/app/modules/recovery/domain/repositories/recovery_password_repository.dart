import 'package:fpdart/fpdart.dart';

import '../erros/erros.dart';
import '../usecases/recovery_password_usecase.dart';

abstract class RecoveryPasswordRepository {
  Future<Either<RecoveryPasswordException, String>> recover(
      RecoveryPasswordParams params);
}
