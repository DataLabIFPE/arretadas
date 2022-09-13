import 'package:fpdart/fpdart.dart';

import '../erros/erros.dart';
import '../repositories/change_password_repository.dart';

abstract class IChangePasswordUsecase {
  Future<Either<ChangePasswordException, String>> call(
      ChangePasswordParams params);
}

class ChangePasswordUsecase implements IChangePasswordUsecase {
  final ChangePasswordRepository repository;

  ChangePasswordUsecase(this.repository);

  @override
  Future<Either<ChangePasswordException, String>> call(
      ChangePasswordParams params) async {
    if (params.id.isEmpty) {
      return Left(ChangePasswordException('Id inválido'));
    }
    if (params.newPassword.isEmpty) {
      return Left(ChangePasswordException('Password vazio.'));
    }

    return await repository.change(params);
  }
}

class ChangePasswordParams {
  final String id;
  final String newPassword;
  final String oldPassword;
  final String nickname;
  final String token;

  ChangePasswordParams({
    required this.token,
    required this.nickname,
    required this.oldPassword,
    required this.id,
    required this.newPassword,
  });
}
