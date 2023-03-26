// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.nombreCompleto,
    required this.dni,
    required this.telefono,
    required this.direccion,
    required this.password,
  });

  String nombreCompleto;
  String dni;
  String telefono;
  String direccion;
  String password;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        nombreCompleto: json["nombreCompleto"],
        dni: json["dni"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "nombreCompleto": nombreCompleto,
        "dni": dni,
        "telefono": telefono,
        "direccion": direccion,
        "password": password,
      };
}
