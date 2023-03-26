import 'package:codigo6_alerts/models/register_model.dart';
import 'package:codigo6_alerts/pages/login_page.dart';
import 'package:codigo6_alerts/services/api_service.dart';
import 'package:codigo6_alerts/utils/types.dart';
import 'package:codigo6_alerts/widget/custom_boton_widget.dart';
import 'package:codigo6_alerts/widget/custom_textfield_password_widget.dart';
import 'package:codigo6_alerts/widget/custom_textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  TextEditingController fullNamectrl = TextEditingController();

  TextEditingController dniCtrl = TextEditingController();

  TextEditingController phoneCtrl = TextEditingController();

  TextEditingController passCtrl = TextEditingController();

  TextEditingController adressCtrl = TextEditingController();

  final registerFormKey = GlobalKey<FormState>();

  register() {
    if (registerFormKey.currentState!.validate()) {
      isLoading = true;
      ApiService apiService = ApiService();
      apiService
          .register(RegisterModel(
              nombreCompleto: fullNamectrl.text,
              dni: dniCtrl.text,
              telefono: phoneCtrl.text,
              direccion: adressCtrl.text,
              password: passCtrl.text))
          .then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
            (route) => false);
        // isLoading = false;
        // setState(() {});
        // print(value);
      }).catchError((error) {
        isLoading = false;
        setState(() {});
        //mapeo mi error
        Map dataError = error as Map;
        //registrasmo los errores
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              // error.toString(),
              dataError["message"],
            ),
          ),
        );
        print("ERROR REGISTER PAGE :::: $error");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Registro",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xffEDEEED),
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ))),
        ),
        backgroundColor: const Color(0xffEDEEED),
        body: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: registerFormKey,
                      child: Column(
                        children: [
                          // Text(""),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: const Text(
                              "Ingrese los datos requeridos",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          CustomTextField(
                            hintText: "nombre completo",
                            type: InputType.text,
                            controller: fullNamectrl,
                          ),
                          CustomTextField(
                            hintText: "DNI",
                            type: InputType.dni,
                            controller: dniCtrl,
                          ),
                          CustomTextField(
                            hintText: "telefono",
                            type: InputType.phone,
                            controller: phoneCtrl,
                          ),
                          CustomTextField(
                            hintText: "direción",
                            type: InputType.text,
                            controller: adressCtrl,
                          ),
                          CustomTextFieldPasswordWidget(
                            hintText: "Constraseña",
                            controller: passCtrl,
                          ),
                          CustomBotton(
                            onPressed: () {
                              register();
                            },
                            text: "Crear Cuenta",
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Ingresar ",
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            isLoading
                ? Container(
                    color: Colors.white.withOpacity(0.8),
                    child: const Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 2.6,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ));
  }
}
