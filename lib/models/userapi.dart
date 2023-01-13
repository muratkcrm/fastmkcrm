// To parse this JSON data, do
//
//     final userapi = userapiFromJson(jsonString);

import 'dart:convert';

Userapi userapiFromJson(String str) => Userapi.fromJson(json.decode(str));

String userapiToJson(Userapi data) => json.encode(data.toJson());

class Userapi {
  Userapi({
    required this.id,
    this.name,
    required this.password,
    this.email,
    required this.username,
    this.active,
  });

  int id;
  String? name;
  String password;
  String? email;
  String username;
  bool? active;

  factory Userapi.fromJson(Map<String, dynamic> json) => Userapi(
    id: json["id"],
    name: json["name"],
    password: json["password"],
    email: json["email"],
    username: json["username"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "password": password,
    "email": email,
    "username": username,
    "active": active,
  };
}