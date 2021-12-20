import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/info_usecase.dart';
import 'external/datasources/info_datasource_impl.dart';
import 'infra/repositories/info_repository_impl.dart';
import 'presenter/pages/info_page.dart';
import 'presenter/store/info_store.dart';

class InfoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => InfoStore(i.get<InfoUsecase>())),
    Bind((i) => InfoUsecase(i.get<InfoRepositoryImpl>())),
    Bind((i) => InfoRepositoryImpl(i.get<InfoDatasorceImpl>())),
    Bind((i) => InfoDatasorceImpl())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InfoPage()),
  ];
}
