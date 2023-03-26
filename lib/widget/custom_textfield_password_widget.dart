import 'package:flutter/material.dart';

class CustomTextFieldPasswordWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextFieldPasswordWidget(
      {super.key, required this.hintText, required this.controller});

  @override
  State<CustomTextFieldPasswordWidget> createState() =>
      _CustomTextFieldPasswordWidgetState();
}

class _CustomTextFieldPasswordWidgetState
    extends State<CustomTextFieldPasswordWidget> {
  bool isInvisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xff909195).withOpacity(0.5),
            blurRadius: 6,
            offset: Offset(5, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        controller: widget.controller,
        obscureText: isInvisible,
        //cambiamos el puntero;
        cursorColor: Colors.red,
        //tamaños del puntero;
        cursorHeight: 30,
        //Aliniamos el texto;
        textAlign: TextAlign.center,

        decoration: InputDecoration(
          suffixIcon: IconButton(
              splashRadius: 2,
              onPressed: () {
                isInvisible = !isInvisible;
                setState(() {});
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: isInvisible == false ? Colors.blue : Colors.grey,
              )),
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
          hintText: widget.hintText,
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
