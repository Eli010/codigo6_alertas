import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:codigo6_alerts/models/register_model.dart';
import 'package:codigo6_alerts/models/user_model.dart';
import 'package:codigo6_alerts/utils/spg_global.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //me creo mi metodo login
  //INGRESO MIS DOS ARGUMENTOS O PARAMETROS QUE USARE PARA EL LOGIN
  Future<UserModel> login(String dni, String password) async {
    // PARA QUE NUESTRA APP NO SE ROMPRA USAMOS EL try{}cacth(e){}
    try {
//nos cremos nuestra url de tipo Uri
      Uri url = Uri.parse("http://167.99.240.65/API/login/");
      //me fijo que tipo de variable es mi post, me creo una nueva instacia
      //petición post
      http.Response response = await http.post(
        url,
        //los header proviene de la base de datos que require para el uso del login
        headers: {
          "Content-Type": "application/json",
        },
        //envio el contenido o los requisito de mi login/usando postman
        //reemplazo con mis dos parametros
        body: json.encode({"username": dni, "password": password}),
        // body: json.encode({"username": "25485264", "password": "12345678"}),
      );

      //AQUI INICIAMOS CON NUESTRA VALIDACIÓN DE NUESTROS DATOS
      //si el login es exitoso me retorna todos los valores que contiene
      if (response.statusCode == 200) {
        //si todo sale bien, nos creamos un mapa de data
        //capturamos la informacion que nos viene de la base de datos
        Map<String, dynamic> data = json.decode(response.body);
        //me creo una variable que capture solo una parte especifica usando nuestro modelo
        UserModel userModel = UserModel.fromJson(data["user"]);

        //STEP 7:
        //aqui uso mi shared prefence
        SPGlobal().isLogin = true;
        SPGlobal().token = data["access"];
        // print(SPGlobal().token = data["access"]);
        // SPGlobal().user = data["user"];
        // print(SPGlobal().user = data["user"]);

        // print(userModel.nombreCompleto);
        //luego retornamos nuestro usermodel,
        // acepta este retorno por que es de ese tipo nuestro future
        return userModel;

        //VALIDAMOS MAS STATUS
      } else if (response.statusCode == 400) {
        //usamos un throw Exception, por que nos pide mandar un userModel o null
        //Exception= es una clase,
        // throw Exception("Credenciales Incorrectas");
        //PARA TENER UN SOLO TIPO DE EXCEPTION, nos crearemos uno de tipo map igual que los catch
        throw {"message": "Tus credenciales son incorrectas"};

        //una exeption general
      } else {
        // throw "Error fatal";//lo convertidmo en un mapa
        throw {"message": "Hubo un error"};
      }
      //si no se cumple retornamos  null
      // return null;
      // LOS CATCH PODEMOS USARLO DE FORMA OBJETIVA PARA DIFERENTES CASOS
      //tiempo de espera, si s cae el servidor
    } on TimeoutException catch (e) {
      return Future.error({
        "message": "Hubo un inconveniente con el servidor intentelo nuevamente",
      });
      // print("error 1: $e");
      //si no tienes internet
    } on SocketException catch (e) {
      //con esto enviamos nuestro error al cliente
      return Future.error({
        "message": "Hubo un inconveniente con el internet intentelo nuevamente",
      });

      //capturar un error de forma general
    } on Error catch (e) {
      return Future.error({
        "message": "Hubo un inconveniente por favor intentelo nuevamente",
      });
      // print("error 3: $e");
    }
  }

  //metodo register
  Future<RegisterModel?> register(RegisterModel user) async {
    //para evitar que se rompa mi codigo uso el try cath

    try {
      //nos cremos una variables de tipo Uri para almacenar mi url
      Uri url = Uri.parse("http://167.99.240.65/API/registro/");
      //ahora realizamos la llamada
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        // body: json.encode({"username": "25485264", "password": "12345678"}),);

        body: json.encode(
          {
            "nombreCompleto": user.nombreCompleto,
            "dni": user.dni,
            "telefono": user.telefono,
            "direccion": user.direccion,
            "password": user.password,
          },
        ),
      );

      print(response);
      print(response.statusCode);
      //valimos nuestro campo
      if (response.statusCode == 201) {
        //usamos nuestro utf para que acepter caracteres especiales
        String dataConvert = const Utf8Decoder().convert(response.bodyBytes);
        //capturamos la informacion que nos viene de la base de datos
        Map<String, dynamic> data = json.decode(dataConvert);
        //
        RegisterModel userModel = RegisterModel.fromJson(data);
        print(" qwewqeqweqweqw $userModel");
        return userModel;
      } else if (response.statusCode == 400) {
        throw {"message": "El usuario ya existe "};
      } else {
        throw {"message": "Hubo un error"};
      }
      // return null;

      // String message = "register hola";
      // print(message);

      //el error provien el tiempo de respuesta de el servidor
    } on TimeoutException catch (e) {
      //personalizamos
      return Future.error({"message": "El tiempo de peticion fue demasiado"});
      // print("Errror de tiempo de respuesta $e");

      //el erro es cuando no tienes internet
    } on SocketException catch (e) {
      return Future.error({"message": "Usted no tiene internet"});

      // print("error de internet, no tiene internet $e");

      //si no esta registrado el erro usando un error general
    } on Error catch (e) {
      return Future.error({
        "message": "Hubo un inconveniente por favor intentelo nuevamente $e"
      });
      // print("error fatal $e");
    }
  }
}
