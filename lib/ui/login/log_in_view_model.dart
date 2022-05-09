
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/firebase_respotiory_impl.dart';
import '../../data/utils/utils.dart';
import '../../domain/entities/state/log_in_state.dart';
import '../../domain/repository/firebase_repository.dart';

final logInViewModelProvider =
StateNotifierProvider<LogInViewModel, LogInState>((ref) =>
    LogInViewModel(repository: ref.read(firebaseRepositoryProvider)));

class LogInViewModel extends StateNotifier<LogInState> {
  LogInViewModel({required FirebaseRepository repository})
      : _repository = repository,
        super(const LogInState());

  final FirebaseRepository _repository;

  void startLoading() => state = state.copy(isLoading: true);

  void endLoading() => state = state.copy(isLoading: false);

  void setEmail(String email) => state = state.copy(email: email);

  void setPassword(String password) => state = state.copy(password: password);

  Future<Result> logIn() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      return Failure(data: "empty-item", message: "Failure");
    }
    startLoading();
    final result = await _repository.logIn(state.email, state.password);
    endLoading();
    return result;
  }

  Result isLogIn() => _repository.isLogIn();
}
