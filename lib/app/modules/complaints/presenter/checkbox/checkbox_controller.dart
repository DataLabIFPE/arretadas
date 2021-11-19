import 'complaint_type.dart';

class CheckboxController {
  final List<ComplaintType> itens1 = [
    ComplaintType(name: 'Sexual'),
    ComplaintType(name: 'Moral'),
    ComplaintType(name: 'Verbal'),
  ];

  final List<ComplaintType> itens2 = [
    ComplaintType(name: 'Física'),
    ComplaintType(name: 'Psicológica'),
    ComplaintType(name: 'Patrimonial'),
  ];

  CheckboxController();
}
