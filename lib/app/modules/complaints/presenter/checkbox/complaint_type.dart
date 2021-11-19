class ComplaintType {
  final String name;
  bool selected;

  ComplaintType({required this.name, this.selected = false});

  @override
  String toString() {
    return 'Name: ' + name + ', ' + 'isSelected: ' + selected.toString() + '\n';
  }
}
