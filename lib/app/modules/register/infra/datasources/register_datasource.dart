import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';

abstract class RegisterDatasource {
  Future<void> cadastrar(RegisterParams params);
}
