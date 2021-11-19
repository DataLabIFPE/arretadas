import 'package:arretadas/app/modules/usefulcontacts/domain/entities/usefulcontact.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/repositories/usefulcontact_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class IUsefulcontactUsecase {
  Future<Either<Failure, List<Usefulcontact>>> call();
}

class UsefulcontactUsecase implements IUsefulcontactUsecase {
  final UsefulcontactRepository repository;

  UsefulcontactUsecase(this.repository);

  @override
  Future<Either<Failure, List<Usefulcontact>>> call() async {
    return await repository.getUsefulcontacts();
  }
}
