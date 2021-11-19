import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/auth/domain/erros/erros.dart';
import 'package:arretadas/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class ILoginUsecase {
  Future<Either<AuthException, User>> call(CredentialsParams params);
}

class LoginUsecase implements ILoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<AuthException, User>> call(CredentialsParams params) async {
    if (params.nickname.length < 3) {
      return Left(AuthException('Nickname inválido'));
    }
    if (params.password.length < 3) {
      return Left(AuthException('Password inválido'));
    }
    return await repository.login(params);
  }
}

class CredentialsParams {
  final String nickname;
  final String password;

  CredentialsParams({required this.nickname, required this.password});
}
