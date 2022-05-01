import 'package:arretadas/app/modules/register/domain/usecases/register_usecase.dart';
import 'package:arretadas/app/modules/register/external/datasources/register_api/register_api.dart';
import 'package:arretadas/app/modules/register/infra/repositories/register_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/register_page.dart';
import 'presenter/store/register_store.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore(i.get<RegisterUsecase>())),
    Bind((i) => RegisterUsecase(i.get<RegisterRepositoryImpl>())),
    Bind((i) => RegisterRepositoryImpl(i.get<RegisterApi>())),
    Bind((i) => RegisterApi(i.get<Dio>())),
    Bind((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RegisterPage()),
  ];
}
