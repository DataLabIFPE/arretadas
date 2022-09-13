import 'package:arretadas/app/modules/change_password/domain/erros/erros.dart';
import 'package:fpdart/fpdart.dart';

import '../usecases/change_password_usecase.dart';

abstract class ChangePasswordRepository {
  Future<Either<ChangePasswordException, String>> change(
      ChangePasswordParams params);
}
