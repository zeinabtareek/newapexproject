import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:newapexproject/model/OrderModel.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/auth_services.dart';
import 'package:newapexproject/utilis/alert.dart';

import '../model/TokenModel.dart';

class LoginServices {
  final _auth = FirebaseAuth.instance;
  final _Store = FirebaseFirestore.instance;
  final _services = AuthServices();
  final Dio _dio = Dio();

  Future<UserModel> login(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUser = await getUserByEmail(password, email, context);
    _services.updateStorage(createdUser);
    return createdUser;
  }

  Future<UserModel> getUserByEmail(
      String password, String email, BuildContext context) async {
    final data = await _Store.collection("users")
        .where("password", isEqualTo: password)
        .where("email", isEqualTo: email)
        .get();
    if (data.docs.length > 0) {
      return UserModel.fromJson(data.docs.first);
    }
    throw Utility.displayErrorAlert(
        "Wrong to find your Email !", "Error", context);
  }

  loginApi(String email, String password) async {
    TokenModel? tokenModel;
    try {
      Response response = await _dio.post(
        "https://otlobna-eg.com/api/v1/auth/delivery-man/login",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        print(response.data);
        tokenModel = TokenModel.fromJson(response.data);
        _services.updateStorageApi(tokenModel);
      }
    } catch (e) {
      print(e);
    }
  }

  getOrder() async {
    try {
      Response response = await _dio.get(
          "https://otlobna-eg.com/api/v1/delivery-man/all-orders/sYrDXw3izNmNVbo64eXdIg2gTI01JZ28QlUfsArciTRDKYmT3R181b6i1vVsGrKxfpbtgmWxmCZBIu8YcV0hYWUTZISTJtufpnJa6B3nelEera91oFpbu7ki/20/1");
      if (response.statusCode == 200) {
        print(response.data);
        return PaginatedOrderModel.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
  }
}
