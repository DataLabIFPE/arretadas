import 'package:flutter_triple/flutter_triple.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuStore extends NotifierStore<Exception, int> {
  MenuStore() : super(0);

  Future<void> signOut() async {
    SharedPreferences.getInstance().then((sp) => sp.clear());
  }
}
