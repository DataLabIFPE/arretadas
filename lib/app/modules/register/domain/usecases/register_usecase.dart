import 'package:arretadas/app/modules/register/domain/erros/erros.dart';
import 'package:arretadas/app/modules/register/domain/repositories/register_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class IRegisterUsecase {
  Future<Either<Exception, bool>> call(RegisterParams params);
}

class RegisterUsecase implements IRegisterUsecase {
  RegisterRepository repository;

  RegisterUsecase(this.repository);

  @override
  Future<Either<RegisterException, bool>> call(RegisterParams params) async {
    return await repository.cadastrar(params);
  }
}

class RegisterParams {
  String nickname;
  String password;
  String city;
  List? aleatoryQuestions;
  String? protectionCode;
  List? roles;

  RegisterParams(
      {required this.nickname,
      required this.password,
      required this.city,
      required this.roles,
      this.protectionCode,
      this.aleatoryQuestions});
}
