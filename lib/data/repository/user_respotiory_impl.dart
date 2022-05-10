import 'dart:io';

import 'package:flutter_hackathon/domain/entities/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/data_source/remote/user_data_source.dart';
import '../../domain/repository/user_repository.dart';
import '../remote/user_data_scource_impl.dart';
import '../utils/utils.dart';

final userRepositoryProvider = Provider((ref) =>
    UserRepositoryImpl(userDataSource: ref.read(userDataSourceProvider)));

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({required UserDataSource userDataSource})
      : _userDataSource = userDataSource;

  final UserDataSource _userDataSource;

  @override
  Future<Result> signUp(String email, String password) async =>
      await _userDataSource.signUp(email, password);

  @override
  Future<Result> logIn(String email, String password) async =>
      await _userDataSource.logIn(email, password);

  @override
  Result isLogIn() => _userDataSource.isLogIn();

  @override
  Future<Result> logOut() async => await _userDataSource.logOut();

  @override
  Result getCurrentUserId() => _userDataSource.getCurrentUserId();

  @override
  Future<Result> updateProfile(String userId, Profile profile) async =>
      _userDataSource.updateProfile(userId, profile);

  @override
  Future<Result> updateProfileImage(String userId, File imageFile) async =>
      _userDataSource.updateProfileImage(userId, imageFile);

  @override
  Future<Result> getProfileData(String userId) async => _userDataSource.getProfileData(userId);
}
