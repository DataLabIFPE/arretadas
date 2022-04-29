import 'package:arretadas/app/modules/recoveryQuestions/domain/usecases/recovery_usecase.dart';
import 'package:arretadas/app/modules/recoveryQuestions/external/datasources/recovery_questions_api/recovery_questions_api.dart';
import 'package:arretadas/app/modules/recoveryQuestions/infra/repositories/recovery_questions_impl.dart';
import 'package:arretadas/app/modules/recoveryQuestions/presenter/pages/password_change_page.dart';
import 'package:arretadas/app/modules/recoveryQuestions/presenter/pages/recovery_questions_page.dart';
import 'package:arretadas/app/modules/recoveryQuestions/presenter/store/recovery_questions_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RecoveryQuestionsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RecoveryQuestionsStore(i.get<RecoveryQuestionsUsecase>())),
    Bind((i) => RecoveryQuestionsUsecase(i.get<RecoveryQuestionsImpl>())),
    Bind((i) => RecoveryQuestionsImpl(i.get<RecoveryQuestionsApi>())),
    Bind((i) => RecoveryQuestionsApi(i.get<Dio>())),
    Bind((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RecoveryQuestionsPage()),
    ChildRoute('/recoverPassword',
        child: (_, args) => PasswordChangePage(id: args.data)),
  ];
}
