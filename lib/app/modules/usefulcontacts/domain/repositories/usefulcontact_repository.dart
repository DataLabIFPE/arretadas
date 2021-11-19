import 'package:arretadas/app/modules/usefulcontacts/domain/entities/usefulcontact.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/errors/erros.dart';
import 'package:fpdart/fpdart.dart';

abstract class UsefulcontactRepository {
  Future<Either<Failure, List<Usefulcontact>>> getUsefulcontacts();
}
