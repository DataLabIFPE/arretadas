import 'package:arretadas/app/modules/usefulcontacts/domain/entities/usefulcontact.dart';

abstract class UsefulcontactDatasource {
  Future<List<Usefulcontact>> getUsefulcontacts();
}
