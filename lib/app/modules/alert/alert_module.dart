import 'package:arretadas/app/modules/alert/domain/usecases/alert_usecase.dart';
import 'package:arretadas/app/modules/alert/external/datasources/alert_api/alert_api.dart';
import 'package:arretadas/app/modules/alert/infra/repositories/alert_repository_impl.dart';
import 'package:arretadas/app/modules/alert/presenter/stores/alert_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/alert_page.dart';

class AlertModule extends WidgetModule {
  AlertModule({Key? key}) : super(key: key);

  @override
  final List<Bind> binds = [
    Bind((i) => AlertStore(i.get<AlertUsecase>())),
    Bind((i) => AlertUsecase(i.get<AlertRepositoryImpl>())),
    Bind((i) => AlertRepositoryImpl(i.get<AlertApi>())),
    Bind((i) => AlertApi(i.get<Dio>())),
    Bind((i) => Dio()),
  ];

  @override
  Widget get view => const AlertPage();
}
