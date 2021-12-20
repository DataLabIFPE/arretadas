import 'package:arretadas/app/modules/auth/external/datasources/auth_api/auth_api.dart';
import 'package:arretadas/app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:arretadas/app/modules/auth/presenter/pages/auth_page.dart';
import 'package:arretadas/app/modules/auth/presenter/store/auth_store.dart';
import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/usecases/login_usecase.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthStore(i.get<LoginUsecase>())),
    Bind((i) => LoginUsecase(i.get<AuthRepositoryImpl>())),
    Bind((i) => AuthRepositoryImpl(i.get<AuthApi>())),
    Bind((i) => AuthApi(i.get<Dio>())),
    Bind((i) => Dio()),
    AsyncBind((i) => SharedPreferences.getInstance()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
  ];
}
