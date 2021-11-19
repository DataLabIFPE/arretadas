import 'package:arretadas/app/core/adapter.dart';
import 'package:arretadas/app/modules/info/domain/entities/info.dart';
import 'package:arretadas/app/modules/info/domain/errors/erros.dart';
import 'package:arretadas/app/modules/info/domain/usecases/info_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class InfoStore extends NotifierStore<Failure, List<Info>> {
  final IInfoUsecase usecase;

  InfoStore(this.usecase) : super([]);

  void getInfos() {
    executeEither(() => EitherAdapterImpl.adapter(usecase.call()));
  }
}
