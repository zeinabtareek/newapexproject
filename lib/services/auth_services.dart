import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:newapexproject/model/TokenModel.dart';
import 'package:newapexproject/model/user_model.dart';

class AuthServices {
  final _store = FirebaseFirestore.instance;
  final _storage = FlutterSecureStorage();
  final _auth = FirebaseAuth.instance;

  updateStorage(UserModel userModel) async {
    await _storage.write(key: 'users', value: userModel.key);
  }

  updateStorageApi(TokenModel userModel) async {
    await _storage.write(key: 'user', value: userModel.token);
  }

  Future<TokenModel> getToken() async {
    final userKey = await _storage.read(key: 'user');
    return TokenModel(token: userKey, zoneWiseTopic: "");
  }

  Future<UserModel?> getCurrentUser() async {
    final userKey = await _storage.read(key: 'users');
    if (userKey == null) {
      return null;
    }
    return UserModel.fromJson(
        await _store.collection('users').doc(userKey).get());
  }

  signOut() async {
    await _auth.signOut();
    _storage.delete(key: 'users');
  }
}
