import 'package:arretadas/app/core/adapter.dart';
import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class RegisterStore extends NotifierStore<Exception, bool> {
  final IRegisterUsecase usecase;

  RegisterStore(this.usecase) : super(false);

  void cadastrar(RegisterParams params) {
    executeEither(() => EitherAdapterImpl.adapter(usecase.call(params)));
  }
}
