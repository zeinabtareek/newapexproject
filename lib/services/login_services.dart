import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/auth_services.dart';

class LoginServices {
  final _auth = FirebaseAuth.instance;
  final _Store = FirebaseFirestore.instance;
  final _services = AuthServices();

  Future<UserModel> login(
        String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUser = await getUserByEmail( password, email);
    _services.updateStorage(createdUser);
    return createdUser;
  }

  Future<UserModel> getUserByEmail(
        String password, String email) async {
    final data = await _Store
        .collection("users")
        .where("password", isEqualTo: password)
        .where("email", isEqualTo: email)
        .get();
    if (data.docs.length > 0) {
      return UserModel.fromJson(data.docs.first);
    }
    throw
        "Wrong to find your Email !";
  }
}
