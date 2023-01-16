// To parse this JSON data, do
//
//     final userapi = userapiFromJson(jsonString);

import 'dart:convert';

List<Userapi> userapiFromJson(String str) => List<Userapi>.from(json.decode(str).map((x) => Userapi.fromJson(x)));

String userapiToJson(List<Userapi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
