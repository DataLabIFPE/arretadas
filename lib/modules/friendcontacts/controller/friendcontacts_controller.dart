import 'dart:convert';

import 'package:arretadas/models/friendcontact_model.dart';
import 'package:arretadas/repositories/friendcontact_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FriendContactController extends ChangeNotifier {
  FriendContactRepository _repository = FriendContactRepository();
  List<FriendContactModel> friendcontact = [];
  bool loading = false;
  bool isVisible = true;
  String error;

  Future<void> findFriendcontacts() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      final sp = await SharedPreferences.getInstance();
      var valor = sp.getString("user");
      var valorMap = json.decode(valor);
      var id = valorMap['id'].toString();
      friendcontact = await _repository.findAllById(id);
      if (friendcontact.isNotEmpty) {
        isVisible = false;
      } else {
        isVisible = true;
      }
    } catch (e) {
      print(e);
      error = 'Erro ao carregar contatos';
    } finally {
      notifyListeners();
      loading = false;
    }
  }

  Future<void> deleteContact(String id) async {
    error = null;
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

  Future<void> updateContact(FriendContactModel friendcontact) async {
    error = null;
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

  Future<void> addContact(FriendContactModel friendcontact) async {
    error = null;
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
