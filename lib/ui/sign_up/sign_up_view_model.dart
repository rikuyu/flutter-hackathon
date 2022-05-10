import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/auth_respotiory_impl.dart';
import '../../data/utils/utils.dart';
import '../../domain/entities/state/sign_up_state.dart';
import '../../domain/repository/auth_repository.dart';

final signUpViewModelProvider =
    StateNotifierProvider<SignUpViewModel, SignUpState>(
        (ref) => SignUpViewModel(repository: ref.read(authRepositoryProvider)));

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel({required AuthRepository repository})
      : _repository = repository,
        super(const SignUpState());

  final AuthRepository _repository;

  void startLoading() => state = state.copy(isLoading: true);

  void endLoading() => state = state.copy(isLoading: false);

  void setEmail(String email) => state = state.copy(email: email);

  void setPassword(String password) => state = state.copy(password: password);

  void setConfirmedPassword(String confirmedPassword) =>
      state = state.copy(confirmedPassword: confirmedPassword);

  Future<Result> signUp() async {
    if (state.email.isEmpty ||
        state.password.isEmpty ||
        state.confirmedPassword.isEmpty) {
      return Failure(data: "empty-item", message: "Failure");
    }
    if (state.password != state.confirmedPassword) {
      return Failure(data: "password-not-confirmed", message: "Failure");
    }
    startLoading();
    final result = await _repository.signUp(state.email, state.password);
    endLoading();
    return result;
  }
}
