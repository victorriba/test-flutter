import 'dart:convert';

class AuthResponse {
  AuthResponse({
    required this.names,
    required this.avatar,
    required this.rol,
    required this.token,
  });
  String names;
  String avatar;
  String rol;
  String token;

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        names: json["names"],
        avatar: json["avatar"],
        rol: json["rol"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "names": names,
        "avatar": avatar,
        "rol": rol,
        "token": token,
      };
}