class ControllerCity {
  static final ControllerCity _singleton = ControllerCity._internal();
  String _city = '';

  factory ControllerCity() {
    return _singleton;
  }

  void setCity(String city) {
    _city = city;
  }

  String getCity() {
    return _city;
  }

  ControllerCity._internal();
}
