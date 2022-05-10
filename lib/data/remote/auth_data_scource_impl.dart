import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/data_source/remote/auth_data_source.dart';
import '../utils/utils.dart';

final authDataSourceProvider = Provider((ref) => AuthDataSourceImpl());

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  @override
  Future<Result> signUp(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        final doc = _store.collection('member').doc(user.uid);
        await doc.set({"uid": user.uid, "email": email});
        return Success(data: user, message: "サインアップ成功");
      }
      return Failure(data: null, message: "サインアップ失敗");
    } on FirebaseAuthException catch (e) {
      return Failure(data: e.code, message: "サインアップエラー");
    }
  }

  @override
  Future<Result> logIn(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        return Success(data: user, message: "ログイン成功");
      }
      return Failure(data: null, message: "ログイン失敗");
    } on FirebaseAuthException catch (e) {
      return Failure(data: e.code, message: "ログインエラー");
    }
  }

  @override
  Result isLogIn() {
    if (_auth.currentUser == null) {
      return Failure(data: null, message: "ログイン状態");
    } else {
      return Success(data: _auth.currentUser, message: "非ログイン状態");
    }
  }

  @override
  Future<Result> logOut() async {
    try {
      await _auth.signOut();
      return Success(data: null, message: "ログアウト成功");
    } on FirebaseAuthException catch (e) {
      return Failure(data: e.code, message: "ログアウト失敗");
    }
  }

  @override
  Result getCurrentUserId() {
    if (_auth.currentUser == null) {
      return Failure(data: null, message: "ログインしていません");
    } else {
      return Success(data: _auth.currentUser!.uid, message: "Success");
    }
  }
}
