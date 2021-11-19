import 'package:arretadas/app/modules/info/domain/errors/erros.dart';
import 'package:arretadas/app/modules/info/domain/entities/info.dart';
import 'package:arretadas/app/modules/info/domain/repositories/info_repository.dart';
import 'package:arretadas/app/modules/info/infra/datasources/info_datasource.dart';
import 'package:fpdart/fpdart.dart';

class InfoRepositoryImpl implements InfoRepository {
  final InfoDatasource datasource;

  InfoRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Info>>> getInfos() async {
    try {
      final list = await datasource.getInfos();
      return list == null
          ? Left<Failure, List<Info>>(DatasourceNull())
          : Right<Failure, List<Info>>(list);
    } catch (e) {
      return Left<Failure, List<Info>>(ErrorSearch());
    }
  }
}
