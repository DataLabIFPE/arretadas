import '../../domain/usecases/change_password_usecase.dart';

abstract class ChangePasswordDatasource {
  Future<String> change(ChangePasswordParams params);
}
