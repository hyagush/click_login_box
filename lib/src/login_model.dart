// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  final String? email;
  final int? id;
  final String? password;
  LoginModel({
    this.email,
    this.id,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (email != null) 'email': email,
      if (id != null) 'id': id,
      if (password != null) 'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'],
      id: map['id'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginModel(email: $email, id: $id, password: $password)';
}
