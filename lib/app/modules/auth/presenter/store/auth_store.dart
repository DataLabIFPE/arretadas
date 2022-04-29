import 'package:arretadas/app/core/adapter.dart';
import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/auth/domain/erros/erros.dart';
import 'package:arretadas/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends NotifierStore<AuthException, User> {
  final ILoginUsecase loginUsecase;

  AuthStore(this.loginUsecase) : super(User.empty());

  void login(CredentialsParams params) {
    executeEither(() => EitherAdapterImpl.adapter(loginUsecase(params)));
  }
}
