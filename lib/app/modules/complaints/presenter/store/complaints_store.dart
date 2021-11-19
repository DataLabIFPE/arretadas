import 'package:arretadas/app/core/adapter.dart';
import 'package:arretadas/app/modules/complaints/domain/entities/complaint.dart';
import 'package:arretadas/app/modules/complaints/domain/erros/erros.dart';
import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';
import 'package:arretadas/app/modules/complaints/presenter/complaints_controller.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ComplaintsStore extends NotifierStore<ComplaintException, Complaint> {
  final ComplaintsController controller;
  final ComplaintUsecase usecase;

  ComplaintsStore({required this.controller, required this.usecase})
      : super(Complaint());

  Future<void> sendComplaint(ComplaintParams params) async {
    executeEither(() => EitherAdapterImpl.adapter(usecase(params)));
  }
}
