import 'package:arretadas/app/modules/change_password/external/datasources/change_password_api/change_password_api.dart';
import 'package:arretadas/app/modules/change_password/presenter/pages/change_password_page.dart';
import 'package:arretadas/app/modules/change_password/presenter/store/change_password_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/change_password_usecase.dart';
import 'infra/repositories/change_password_impl.dart';

class ChangePasswordModule extends WidgetModule {
  final String id;
  final String nickname;

  ChangePasswordModule({required this.id, required this.nickname, Key? key})
      : super(key: key);

  @override
  final List<Bind> binds = [
    Bind((i) => ChangePasswordStore(i.get<ChangePasswordUsecase>())),
    Bind((i) => ChangePasswordUsecase(i.get<ChangePasswordImpl>())),
    Bind((i) => ChangePasswordImpl(i.get<ChangePasswordApi>())),
    Bind((i) => ChangePasswordApi(i.get<Dio>())),
    Bind((i) => Dio()),
  ];

  @override
  Widget get view => ChangePasswordPage(
        id: id,
        nickname: nickname,
      );
}
