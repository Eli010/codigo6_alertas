import 'package:codigo6_alerts/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal {
  //STEP 2
  //aqui nos volvemos a llamar
  static final SPGlobal _instance = SPGlobal._();
  //STEP 3
  //creamos nuestro singleton
  SPGlobal._();
  factory SPGlobal() {
    print("instancia:::: $_instance");
    return _instance;
  }

  //STEP 1
  //me creo una variable de tipo sharedprefecences
  late SharedPreferences prefs;
  //luego me creo una función
  initSharedPreferences() async {
    //me creo una instancia
    prefs = await SharedPreferences.getInstance();
    print(" pref:::: $prefs");
  }

  //STEP 4
  //aqui vamos a mencionar que datos queremos guardar con un metodo set

  set token(String value) {
    //aqui colocamos con el nombre que se guardara
    prefs.setString("token", value);
  }

  // lo traemos con nuetro metodo get
  String get token => prefs.getString("token") ?? "";

  set user(String value) {
    prefs.setStringList("user", ["user"]);
  }

  String get user => prefs.getString("user") ?? "";

  //STEP 5
  //tambien puedo crear un objeto para ver si esta logeado o no?
  //guardo mi datos
  set isLogin(bool value) {
    prefs.setBool("isLogin", value);
  }

  //obtego mis datos y si esta logeao o no
  bool get isLogin => prefs.getBool("isLogin") ?? false;
}
