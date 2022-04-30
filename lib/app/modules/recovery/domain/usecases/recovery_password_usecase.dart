import 'package:fpdart/fpdart.dart';

import '../erros/erros.dart';
import '../repositories/recovery_password_repository.dart';

abstract class IRecoveryPasswordUsecase {
  Future<Either<RecoveryPasswordException, String>> call(
      RecoveryPasswordParams params);
}

class RecoveryPasswordUsecase implements IRecoveryPasswordUsecase {
  final RecoveryPasswordRepository repository;

  RecoveryPasswordUsecase(this.repository);

  @override
  Future<Either<RecoveryPasswordException, String>> call(
      RecoveryPasswordParams params) async {
    if (params.id.isEmpty) {
      return Left(RecoveryPasswordException('Id inválido'));
    }
    if (params.newPassword.isEmpty) {
      return Left(RecoveryPasswordException('Password vazio.'));
    }

    return await repository.recover(params);
  }
}

class RecoveryPasswordParams {
  final String id;
  final String newPassword;

  RecoveryPasswordParams({
    required this.id,
    required this.newPassword,
  });
}
