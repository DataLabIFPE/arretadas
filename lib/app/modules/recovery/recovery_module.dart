import 'package:arretadas/app/modules/recovery/domain/usecases/recovery_password_usecase.dart';
import 'package:arretadas/app/modules/recovery/domain/usecases/recovery_questions_usecase.dart';
import 'package:arretadas/app/modules/recovery/external/datasources/recovery_password_api/recovery_password_api.dart';
import 'package:arretadas/app/modules/recovery/external/datasources/recovery_questions_api/recovery_questions_api.dart';
import 'package:arretadas/app/modules/recovery/infra/repositories/recovery_password_impl.dart';
import 'package:arretadas/app/modules/recovery/infra/repositories/recovery_questions_impl.dart';
import 'package:arretadas/app/modules/recovery/presenter/pages/recovery_password_page.dart';
import 'package:arretadas/app/modules/recovery/presenter/pages/recovery_questions_page.dart';
import 'package:arretadas/app/modules/recovery/presenter/store/recovery_password_store.dart';
import 'package:arretadas/app/modules/recovery/presenter/store/recovery_questions_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoveryQuestionsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RecoveryQuestionsStore(i.get<RecoveryQuestionsUsecase>())),
    Bind((i) => RecoveryQuestionsUsecase(i.get<RecoveryQuestionsImpl>())),
    Bind((i) => RecoveryQuestionsImpl(i.get<RecoveryQuestionsApi>())),
    Bind((i) => RecoveryQuestionsApi(i.get<Dio>())),
    Bind((i) => RecoveryPasswordStore(i.get<RecoveryPasswordUsecase>())),
    Bind((i) => RecoveryPasswordUsecase(i.get<RecoveryPasswordImpl>())),
    Bind((i) => RecoveryPasswordImpl(i.get<RecoveryPasswordApi>())),
    Bind((i) => RecoveryPasswordApi(i.get<Dio>())),
    Bind((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RecoveryQuestionsPage()),
    ChildRoute('/recoverPassword',
        child: (_, args) => PasswordChangePage(id: args.data)),
  ];
}
