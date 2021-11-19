import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/repositories/friendcontact_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class IFriendcontactUsecase {
  Future<Either<Failure, List<Friendcontact>>> call();
}

class FriendcontactUsecase implements IFriendcontactUsecase {
  final FriendcontactRepository repository;

  FriendcontactUsecase(this.repository);

  @override
  Future<Either<Failure, List<Friendcontact>>> call() async {
    return await repository.getFriendcontacts();
  }
}
