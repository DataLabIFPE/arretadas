import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';

abstract class FriendcontactDatasource {
  Future<List<Friendcontact>> getFriendcontacts(String id);
}
