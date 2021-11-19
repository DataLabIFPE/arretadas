import 'package:arretadas/app/modules/usefulcontacts/domain/usecases/usefulcontact_usecase.dart';
import 'package:arretadas/app/modules/usefulcontacts/external/datasources/usefulcontacts_api/usefulcontacts_api.dart';
import 'package:arretadas/app/modules/usefulcontacts/infra/repositories/usefulcontact_repository_impl.dart';
import 'package:arretadas/app/modules/usefulcontacts/presenter/pages/usefulcontacts_page.dart';
import 'package:arretadas/app/modules/usefulcontacts/presenter/store/usefulcontacts_store.dart';
import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';

class UsefulcontactsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
        (i) => UsefulcontactsStore(i.get<UsefulcontactUsecase>())),
    Bind((i) => UsefulcontactUsecase(i.get<UsefulcontactRepositoryImpl>())),
    Bind((i) => UsefulcontactRepositoryImpl(i.get<UsefulcontactsApi>())),
    Bind((i) => UsefulcontactsApi(i.get<Dio>())),
    Bind((i) => Dio())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => UsefulcontactsPage()),
  ];
}
