import 'package:arretadas/app/core/adapter.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/usecases/friendcontact_usecase.dart';
import 'package:arretadas/app/modules/friendcontacts/domain/errors/erros.dart';

import 'package:flutter_triple/flutter_triple.dart';

class FriendcontactsStore extends NotifierStore<Failure, List<Friendcontact>> {
  final IFriendcontactUsecase usecase;

  FriendcontactsStore({required this.usecase}) : super([]);

  void getFriendcontacts() {
    executeEither(() => EitherAdapterImpl.adapter(usecase()));
  }
}
