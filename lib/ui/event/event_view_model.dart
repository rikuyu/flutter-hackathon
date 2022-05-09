
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/firebase_respotiory_impl.dart';
import '../../data/utils/utils.dart';
import '../../domain/entities/state/log_in_state.dart';
import '../../domain/repository/firebase_repository.dart';

final eventViewModelProvider =
StateNotifierProvider<EventViewModel, LogInState>((ref) =>
    EventViewModel(repository: ref.read(firebaseRepositoryProvider)));

class EventViewModel extends StateNotifier<LogInState> {
  EventViewModel({required FirebaseRepository repository})
      : _repository = repository,
        super(const LogInState());

  final FirebaseRepository _repository;

  void startLoading() => state = state.copy(isLoading: true);

  void endLoading() => state = state.copy(isLoading: false);

}
