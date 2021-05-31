import 'package:flutter/material.dart';
import 'package:arretadas/repositories/usefulcontacts_repository.dart';
import 'package:arretadas/models/usefulcontact_model.dart';

class UsefulController extends ChangeNotifier {
  UsefulcontactsRepository _repository = UsefulcontactsRepository();
  List<UsefulcontactModel> usefulcontacts = [];
  bool loading = false;
  String error;

  Future<void> findUsefulcontacts() async {
    loading = true;
    error = null;
    notifyListeners();
    try {} catch (e) {
      print(e);
      error = 'Erro ao carregar contatos';
    } finally {
      notifyListeners();
      loading = false;
    }
  }
}
