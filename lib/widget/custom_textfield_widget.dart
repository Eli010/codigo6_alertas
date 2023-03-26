import 'package:codigo6_alerts/utils/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final InputType type;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.type,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff909195).withOpacity(0.5),
            blurRadius: 6,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 15),
      //de textField convierto a TextFormField
      child: TextFormField(
        controller: controller,
        keyboardType: type == InputType.dni || type == InputType.phone
            ? TextInputType.number
            : TextInputType.text,
        maxLength: type == InputType.dni
            ? 8
            : type == InputType.phone
                ? 9
                : null,
        //para realizar validaciones
        inputFormatters: type == InputType.dni || type == InputType.phone
            ? [FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))]
            : [],
        //cambiamos el puntero;
        cursorColor: Colors.red,
        //tamaños del puntero;
        cursorHeight: 30,
        //Aliniamos el texto;
        textAlign: TextAlign.center,

        decoration: InputDecoration(
          //para quitar el maxline
          counterText: "",
          // label: Text("DNI"),
          focusedBorder: OutlineInputBorder(
            //le damos el borde de nuestra texfield pero el modo focus;
            borderRadius: BorderRadius.circular(16.0),
            //le damos el color y ancho a nuestra linea inferior;
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
          //cambiamos el color de relleno;
          fillColor: Colors.white,
          //aceptamos el cambio del color de relleno;
          filled: true,
          //manejamos el paddion de nuestro texfield;
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          //el mensaje post llenado;
          hintText: hintText,
        ),

        //AQUI EMPEZAMOS A VALIDAR NUESTRO TEXTFORMFIELD
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return "Campo obligatorio";
          }
          return null;
        },
      ),
    );
  }
}
