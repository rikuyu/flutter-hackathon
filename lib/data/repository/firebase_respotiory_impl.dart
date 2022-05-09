import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/data_source/remote/auth_data_source.dart';
import '../../domain/repository/firebase_repository.dart';
import '../remote/auth_data_scource_impl.dart';
import '../utils/utils.dart';


final firebaseRepositoryProvider = Provider((ref) => FirebaseRepositoryImpl(
    authDataSource: ref.read(authDataSourceProvider)));

class FirebaseRepositoryImpl implements FirebaseRepository {
  FirebaseRepositoryImpl(
      {required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;

  final AuthDataSource _authDataSource;

  @override
  Future<Result> signUp(String email, String password) async =>
      await _authDataSource.signUp(email, password);

  @override
  Future<Result> logIn(String email, String password) async =>
      await _authDataSource.logIn(email, password);

  @override
  Result isLogIn() => _authDataSource.isLogIn();

  @override
  Future<Result> logOut() async => await _authDataSource.logOut();

  @override
  Result getCurrentUserId() => _authDataSource.getCurrentUserId();
}
