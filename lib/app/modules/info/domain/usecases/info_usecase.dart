import 'package:arretadas/app/modules/info/domain/entities/info.dart';
import 'package:arretadas/app/modules/info/domain/errors/erros.dart';
import 'package:arretadas/app/modules/info/domain/repositories/info_repository.dart';
import 'package:fpdart/fpdart.dart';

abstract class IInfoUsecase {
  Future<Either<Failure, List<Info>>> call();
}

class InfoUsecase implements IInfoUsecase {
  final InfoRepository repository;

  InfoUsecase(this.repository);

  @override
  Future<Either<Failure, List<Info>>> call() async {
    return await repository.getInfos();
  }
}
