class Controller {
  static final Controller _singleton = Controller._internal();
  String _city = '';

  factory Controller() {
    return _singleton;
  }

  void setCity(String city) {
    this._city = city;
  }

  String getCity() {
    return this._city;
  }

  Controller._internal();
}
