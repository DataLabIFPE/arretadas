import 'package:arretadas/app/modules/register/domain/erros/erros.dart';
import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract class RegisterRepository {
  Future<Either<RegisterException, bool>> cadastrar(RegisterParams params);
}
