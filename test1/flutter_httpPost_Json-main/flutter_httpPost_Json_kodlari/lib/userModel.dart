import 'dart:convert';

UserModel userModelFromJson(dynamic str) =>
    UserModel.fromJson(json.decode(str));

dynamic userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String firstname;
  String lastname;
  String telefon;
  String email;
  String sifre;
  String sifre2;

  UserModel(
      {this.firstname,
      this.lastname,
      this.telefon,
      this.email,
      this.sifre,
      this.sifre2});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstname: json["first_name"],
      lastname: json["last_name"],
      telefon: json["telefon"],
      email: json["email"],
      sifre: json["password"],
      sifre2: json["password2"],
    );
  }

  Map<String, dynamic> toJson() => {
        "first_name": firstname,
        "last_name": lastname,
        "telefon": telefon,
        "email": email,
        "password": sifre,
        "password2": sifre2,
      };
}
