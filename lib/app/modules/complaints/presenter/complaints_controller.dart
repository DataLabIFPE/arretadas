import 'package:flutter/material.dart';

class ComplaintsController {
  late List<String> itens;
  late DateTime date;
  late TimeOfDay time;

  ComplaintsController() {
    date = DateTime.now();
    time = TimeOfDay.now();
    itens = [
      'Sexual',
      'Moral',
      'Verbal',
      'Física',
      'Psicológica',
      'Patrimonial'
    ];
  }
}
