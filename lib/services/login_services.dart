import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/auth_services.dart';

class LoginServices {
  final _auth = FirebaseAuth.instance;
  final _Store = FirebaseFirestore.instance;
  final _services = AuthServices();

  Future<UserModel?> login(String password, String email) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(password);
      print(email);
    } catch (e) {
      print(e);
    }
    print(password);
    print(email);

    UserModel? user = await getUserByEmail(email, password);
    _services.updateStorage(user!);
    return user;
  }

  Future<UserModel?> getUserByEmail(String email, String password) async {
    final data = await _Store.collection("users")
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();
    if (data.docs.length > 0) {
      return UserModel.fromJson(data.docs.first);
    }
    throw 'Exception';
  }
}
