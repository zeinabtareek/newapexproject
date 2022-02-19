import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? key;

  UserModel({this.email, this.password, this.name, this.phone, this.key});

  factory UserModel.fromJson(DocumentSnapshot snapShot) {
    return UserModel(
        email: snapShot['email'],
        name: snapShot['name'],
        password: snapShot['password'],
        phone: snapShot['phone'],
        key: snapShot.id);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    return map;
  }
}
