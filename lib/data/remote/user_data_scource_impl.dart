import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_hackathon/domain/entities/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/data_source/remote/user_data_source.dart';
import '../utils/utils.dart';

final userDataSourceProvider = Provider((ref) => UserDataSourceImpl());

class UserDataSourceImpl implements UserDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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
    } catch (e) {
      return Failure(data: e.toString(), message: "Error");
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
    } catch (e) {
      return Failure(data: e.toString(), message: "Error");
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
    } catch (e) {
      return Failure(data: e.toString(), message: "Error");
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

  @override
  Future<Result> updateProfile(String userId, Profile profile) async {
    try {
      await _store.collection("member").doc(userId).set(Profile.toMap(profile));
      return Success(data: null, message: "Profile Updated");
    } on FirebaseAuthException catch (e) {
      return Failure(data: e.code, message: "Error");
    } catch (e) {
      return Failure(data: e.toString(), message: "Error");
    }
  }

  @override
  Future<Result> updateProfileImage(String userId, File imageFile) async {
    try {
      final TaskSnapshot result = await _storage
          .ref("member/$userId/profile/$userId")
          .putFile(imageFile);
      final imageUrl = await result.ref.getDownloadURL();
      return Success(data: imageUrl, message: "Success");
    } on FirebaseAuthException catch (e) {
      return Failure(data: e.code, message: "Error");
    } catch (e) {
      return Failure(data: e.toString(), message: "Error");
    }
  }

  @override
  Future<Result> getProfileData(String userId) async {
    try {
      final doc = _store.collection("member").doc(userId);
      final result = await doc.get();
      final profile = Profile.fromJson(result.data()!);
      return Success(data: profile, message: "Success");
    } on FirebaseAuthException catch (e) {
      return Failure(data: e.code, message: "Error");
    } catch (e) {
      return Failure(data: e.toString(), message: "Error");
    }
  }
}
