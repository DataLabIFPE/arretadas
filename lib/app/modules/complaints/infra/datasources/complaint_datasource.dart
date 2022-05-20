import 'package:arretadas/app/modules/complaints/domain/usecases/complaint_usecase.dart';

abstract class ComplaintDatasource {
  Future<String> sendComplaint(ComplaintParams params);
}
