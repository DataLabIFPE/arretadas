import 'package:arretadas/app/core/adapter.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/entities/usefulcontact.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/errors/erros.dart';
import 'package:arretadas/app/modules/usefulcontacts/domain/usecases/usefulcontact_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class UsefulcontactsStore extends NotifierStore<Failure, List<Usefulcontact>> {
  final IUsefulcontactUsecase usecase;

  UsefulcontactsStore(this.usecase) : super([]);

  void getUsefulcontacts() {
    executeEither(() => EitherAdapterImpl.adapter(usecase()));
  }
}
