

import '../../../data/utils/utils.dart';

abstract class AuthDataSource {

  Result isLogIn();

  Future<Result> signUp(String email, String password);

  Future<Result> logIn(String email, String password);

  Future<Result> logOut();

  Result getCurrentUserId();
}