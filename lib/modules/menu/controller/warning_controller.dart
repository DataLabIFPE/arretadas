import 'package:arretadas/models/friendcontact_model.dart';
import 'package:arretadas/repositories/friendcontact_repository.dart';
import 'package:flutter/cupertino.dart';

class WarningController extends ChangeNotifier {
  bool isVisibility = true;
  String error;
  final FriendContactRepository _repository = FriendContactRepository();
  List<FriendContactModel> friendcontacts = [];

  Future<void> findFriendContacts() async {
    error = null;
    notifyListeners();
    try {
      friendcontacts = await _repository.findAll();
      if (friendcontacts.isNotEmpty) {
        isVisibility = false;
        notifyListeners();
      } else {
        isVisibility = true;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      error = 'Erro ao carregar Amigos';
    } finally {
      notifyListeners();
    }
  }
}
