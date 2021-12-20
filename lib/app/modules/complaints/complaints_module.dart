import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';
import 'package:arretadas/app/modules/complaints/external/datasources/complaints_api.dart';
import 'package:arretadas/app/modules/complaints/infra/repositories/complaint_repository_impl.dart';
import 'package:arretadas/app/modules/complaints/presenter/complaints_controller.dart';
import 'package:arretadas/app/modules/complaints/presenter/store/complaints_store.dart';
import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/complaints_page.dart';

class ComplaintsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ComplaintsStore(
        controller: i.get<ComplaintsController>(),
        usecase: i.get<ComplaintUsecase>())),
    Bind((i) => ComplaintUsecase(i.get<ComplaintRepositoryImpl>())),
    Bind((i) => ComplaintRepositoryImpl(i.get<ComplaintsApi>())),
    Bind((i) => ComplaintsApi(i.get<Dio>())),
    Bind((i) => Dio()),
    Bind((i) => ComplaintsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ComplaintsPage()),
  ];
}
