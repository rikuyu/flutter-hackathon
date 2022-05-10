import 'dart:io';

import '../../data/utils/utils.dart';
import '../entities/profile.dart';

abstract class UserRepository {
  Result isLogIn();

  Future<Result> signUp(String email, String password);

  Future<Result> logIn(String email, String password);

  Future<Result> logOut();

  Result getCurrentUserId();

  Future<Result> updateProfile(String userId, Profile profile);

  Future<Result> updateProfileImage(String userId, File imageFile);

  Future<Result> getProfileData(String userId);
}
