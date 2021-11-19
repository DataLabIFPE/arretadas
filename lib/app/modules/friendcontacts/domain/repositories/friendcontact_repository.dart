import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/errors/erros.dart';
import 'package:fpdart/fpdart.dart';

abstract class FriendcontactRepository {
  Future<Either<Failure, List<Friendcontact>>> getFriendcontacts();
}
