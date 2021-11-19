import 'package:arretadas/app/modules/info/domain/entities/info.dart';

abstract class InfoDatasource {
  Future<List<Info>?> getInfos();
}
