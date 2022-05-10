import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/auth_respotiory_impl.dart';
import '../../domain/entities/state/profile_state.dart';
import '../../domain/repository/auth_repository.dart';

final profileViewModelProvider =
StateNotifierProvider<ProfileViewModel, ProfileState>(
        (ref) => ProfileViewModel(repository: ref.read(authRepositoryProvider)));

class ProfileViewModel extends StateNotifier<ProfileState> {
  ProfileViewModel({required AuthRepository repository})
      : _repository = repository,
        super(const ProfileState(events: []));

  final AuthRepository _repository;

  void startLoading() => state = state.copy(isLoading: true);

  void endLoading() => state = state.copy(isLoading: false);
}
