import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/friendcontact_usecase.dart';
import 'external/datasources/friendcontacts_api/friendcontacts_api.dart';
import 'infra/repositories/friendcontact_repository_impl.dart';
import 'presenter/pages/friendcontacts_page.dart';
import 'presenter/store/friendcontacts_store.dart';

class FriendcontactsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
        (i) => FriendcontactsStore(usecase: i.get<FriendcontactUsecase>())),
    Bind((i) => FriendcontactUsecase(i.get<FriendcontactRepositoryImpl>())),
    Bind((i) => FriendcontactRepositoryImpl(i.get<FriendcontactsApi>())),
    Bind((i) => FriendcontactsApi(i.get<Dio>())),
    Bind((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const FriendcontactsPage()),
  ];
}
