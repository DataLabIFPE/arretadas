import 'package:arretadas/app/modules/auth/domain/entities/user.dart';
import 'package:arretadas/app/modules/auth/domain/usecases/login_usecase.dart';

abstract class AuthDatasource {
  Future<User> login(CredentialsParams params);
}
