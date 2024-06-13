// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  final String? email;
  final int? idPessoa;
  final String? password;
  final int? idServer;
  final bool? socialLogin;
  final String? marca;
  final String? modelo;
  final String? serialNumber;
  LoginModel({
    this.email,
    this.idPessoa,
    this.password,
    this.idServer,
    this.socialLogin,
    this.marca,
    this.modelo,
    this.serialNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (email != null) 'email': email,
      if (idPessoa != null) 'idPessoa': idPessoa,
      if (password != null) 'password': password,
      if (idServer != null) 'idServer': idServer,
      if (socialLogin != null) 'socialLogin': socialLogin,
      if (marca != null) 'marca': marca,
      if (modelo != null) 'modelo': modelo,
      if (serialNumber != null) 'serialNumber': serialNumber,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'],
      idPessoa: map['idPessoa'],
      password: map['password'],
      idServer: map['idServer'],
      socialLogin: map['socialLogin'],
      marca: map['marca'],
      modelo: map['modelo'],
      serialNumber: map['serialNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginModel(email: $email, idPessoa: $idPessoa, password: $password, idServer: $idServer, socialLogin: $socialLogin, marca: $marca, modelo: $modelo, serialNumber: $serialNumber)';
  }
}
