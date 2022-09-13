import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/delete_account_usecase.dart';
import 'external/datasources/user_api/user_api.dart';
import 'infra/repositories/delete_account_impl.dart';
import 'presenter/pages/delete_account_page.dart';
import 'presenter/stores/delete_account_store.dart';

class DeleteAccountModule extends WidgetModule {
  DeleteAccountModule({Key? key}) : super(key: key);

  @override
  final List<Bind> binds = [
    Bind((i) => DeleteAccountStore(i.get<DeleteAccountUsecase>())),
    Bind((i) => DeleteAccountUsecase(i.get<DeleteAccountRepositoryImpl>())),
    Bind((i) => DeleteAccountRepositoryImpl(i.get<UserApi>())),
    Bind((i) => UserApi(i.get<Dio>())),
    Bind((i) => Dio()),
  ];

  @override
  Widget get view => const DeleteAccountPage();
}
