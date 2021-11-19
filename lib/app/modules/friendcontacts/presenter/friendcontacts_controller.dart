import 'package:arretadas/app/modules/friendcontacts/domain/entities/friendcontact.dart';
import 'package:arretadas/app/modules/friendcontacts/external/datasources/friendcontacts_api/friendcontact_repository.dart';
import 'package:flutter/material.dart';

class FriendContactController extends ChangeNotifier {
  final _repository = FriendContactRepository();
  bool loading = false;
  bool isVisible = true;
  late String error;

  Future<void> deleteContact(String id) async {
    notifyListeners();
    try {
      await _repository.removeContact(id);
    } catch (e) {
      error = 'Erro ao remover contato';
    } finally {
      notifyListeners();
      loading = false;
    }
  }

  Future<void> updateContact(Friendcontact friendcontact) async {
    notifyListeners();
    try {
      await _repository.updateContact(friendcontact);
    } catch (e) {
      error = 'Erro ao atualizar contato';
    } finally {
      notifyListeners();
      loading = false;
    }
  }

  Future<void> addContact(Friendcontact friendcontact) async {
    notifyListeners();
    try {
      await _repository.addContact(friendcontact);
    } catch (e) {
      error = 'Erro ao adicionar contato';
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
