import 'package:arretadas/models/complaint_model.dart';
import 'package:arretadas/repositories/complaint_repository.dart';
import 'package:flutter/material.dart';

class ComplaintsController extends ChangeNotifier {
  ComplaintRepository _repository = ComplaintRepository();
  List<ComplaintModel> complaints = [];
  bool loading;
  String error;
  bool sendSucess = false;

  Future<void> findComplaints() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      complaints = await _repository.findAll();
      sendSucess = true;
    } catch (e) {
      print(e);
      error = 'Erro ao carregar denúncias';
    } finally {
      notifyListeners();
      loading = false;
    }
  }

  Future<void> sendComplaint(
      dynamic local, String data, String hora, String tipoViolencia) async {
    error = null;
    notifyListeners();
    try {
      await _repository.sendComplaint(local, data, hora, tipoViolencia);
      sendSucess = true;
    } catch (e) {
      print(e);
      error = 'Erro ao enviar denúncia';
    } finally {
      notifyListeners();
    }
  }
}
