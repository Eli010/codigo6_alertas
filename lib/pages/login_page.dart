import 'package:codigo6_alerts/models/user_model.dart';
import 'package:codigo6_alerts/pages/init_page.dart';
import 'package:codigo6_alerts/pages/register_page.dart';
import 'package:codigo6_alerts/services/api_service.dart';
import 'package:codigo6_alerts/utils/types.dart';
import 'package:codigo6_alerts/widget/custom_boton_widget.dart';
import 'package:codigo6_alerts/widget/custom_textfield_password_widget.dart';
import 'package:codigo6_alerts/widget/custom_textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserModel? user;
  //me creo los controladores
  final TextEditingController _dniCtrl = TextEditingController();

  final TextEditingController _passwordCtrl = TextEditingController();

//! ME creo una varable de tipo bool, indicador de carga
  bool isLoading = false;

  //empezamos a validor nuestros textfiel, nos creamos una variable de tipo globalkey
  final loginFormKey = GlobalKey<FormState>();

  //ME CREAO UNA FUNCION PARA LLAMAR MIS DATOS Y ALERTAS DE ERRORES
  void login() {
    //REALIZO LA VALIDACION DE MIS CAMPOS DE TEXTO
    if (loginFormKey.currentState!.validate()) {
      // hago que mi variable isLoading sea true
      isLoading = true;
      //actulizamos el estado
      setState(() {});

      //coloco todo el codigo que tenia
      //nos creamos una instancia de tipo ApiService
      ApiService apiService = ApiService();
      print("aPI  LOGIN:: SERVICE $apiService");
      //con la instancia realizamos la llamada al metodo
      //con el .then(()){} imprimimosnuestro valor(value)
      //coloco mis dos parametros que provienen de mi controldor, solo agrego el .text
      apiService.login(_dniCtrl.text, _passwordCtrl.text).then((value) {
        //ahora navegamos a la siguiente pagina
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => InitPage(),
            ),
            (route) => false);
        print("LGIN:: VALUE $value");
        //con esto capturamos el mensaje de errores desde nuestra api_service
        //volcemos a actulizar el estado de la variable si todo es correcto
        // isLoading = false;
        // setState(() {});
      }).catchError((error) {
        //volcemos a actulizar el estado de la variable si sale error
        isLoading = false;
        setState(() {});

        //con esto le mencionamos que es un mapa o forzarlo que sea un mapa
        Map dataError = error as Map;
        //mostramos en pantalla nuestro error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              // error.toString(),
              dataError["message"],
            ),
          ),
        );
        print("ERROR LOGIN PAGE:::::: $error");
      });
    }
  }

  // UserModel? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEDEEED),
        //!nuestro SafeArea envolvemos en un stack
        body: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    //agregamos un widget Form a nuestra columna principal
                    child: Form(
                      //colomaos nuestra llave o key, creado anteriormente
                      key: loginFormKey,
                      child: Column(
                        children: [
                          // Text(""),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(150),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xffD4D5D7).withOpacity(0.5),
                                  const Color(0xff909195).withOpacity(0.9),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.network(
                                "https://globalallianceprotection.com/wp-content/uploads/2022/05/cropped-Logo.png",
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: const Text(
                              "Cubrimos mas de 6 tipos de casos para ti y tú familia, seguridad garantizada",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          CustomTextField(
                            controller: _dniCtrl,
                            hintText: "DNI",
                            type: InputType.dni,
                          ),
                          CustomTextFieldPasswordWidget(
                            hintText: "Constraseña",
                            controller: _passwordCtrl,
                          ),
                          CustomBotton(
                            onPressed: () {
                              login();
                            },
                            text: "Iniciar Sesión",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ));
                            },
                            child: const Text(
                              "Crear cuenta",
                              style: TextStyle(
                                  decorationThickness: 2,
                                  inherit: true,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(2, 2),
                                      blurRadius: 5,
                                    )
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //!usamos nuestro circularProgressIndicator()
            isLoading
                ? Container(
                    color: Colors.white.withOpacity(0.8),
                    child: const Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color: Colors.black87,
                          strokeWidth: 2.6,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }
}
