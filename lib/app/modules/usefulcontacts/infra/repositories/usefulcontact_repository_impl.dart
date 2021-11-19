import 'package:arretadas/app/modules/usefulcontacts/domain/entities/usefulcontact.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/repositories/usefulcontact_repository.dart';
import 'package:arretadas/app/modules/usefulcontacts/infra/datasources/usefulcontact_datasource.dart';
import 'package:fpdart/fpdart.dart';

class UsefulcontactRepositoryImpl implements UsefulcontactRepository {
  final UsefulcontactDatasource datasource;

  UsefulcontactRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Usefulcontact>>> getUsefulcontacts() async {
    try {
      final usefulcontacts = await datasource.getUsefulcontacts();
      return Right(usefulcontacts);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
