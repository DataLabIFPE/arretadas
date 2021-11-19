import 'package:arretadas/app/modules/info/domain/entities/info.dart';
import 'package:arretadas/app/modules/info/domain/errors/erros.dart';

import 'package:fpdart/fpdart.dart';

abstract class InfoRepository {
  Future<Either<Failure, List<Info>>> getInfos();
}
