import 'package:flutter_hackathon/data/repository/event_repository_impl.dart';
import 'package:flutter_hackathon/domain/entities/favorite_event.dart';
import 'package:flutter_hackathon/domain/repository/event_respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/auth_respotiory_impl.dart';
import '../../data/utils/utils.dart';
import '../../domain/entities/state/profile_state.dart';
import '../../domain/repository/auth_repository.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>((ref) =>
        ProfileViewModel(
            authRepository: ref.read(authRepositoryProvider),
            eventRepository: ref.read(eventRepositoryProvider)));

class ProfileViewModel extends StateNotifier<ProfileState> {
  ProfileViewModel(
      {required AuthRepository authRepository,
      required EventRepository eventRepository})
      : _authRepository = authRepository,
        _eventRepository = eventRepository,
        super(const ProfileState(events: [])) {
    getFavoriteEvents();
  }

  final AuthRepository _authRepository;
  final EventRepository _eventRepository;

  void startLoading() => state = state.copy(isLoading: true);

  void endLoading() => state = state.copy(isLoading: false);

  void setFavoriteEvents(List<FavoriteEvent> events) =>
      state = state.copy(events: events);

  String? getCurrentUserId() {
    final result = _authRepository.getCurrentUserId();
    if (result is Success) {
      return result.data;
    } else {
      return null;
    }
  }

  Future<Result> getFavoriteEvents() async {
    startLoading();
    final userId = getCurrentUserId();
    if (userId == null) {
      endLoading();
      return Failure(data: null, message: "未ログインユーザー");
    }
    final result = await _eventRepository.getFavoriteEvents(userId);
    if (result is Success) {
      setFavoriteEvents(result.data);
      endLoading();
      return Success(data: null, message: result.message);
    }
    endLoading();
    return Failure(data: null, message: result.message);
  }

  Future<Result> deleteFavoriteEvent(FavoriteEvent event) async {
    final userId = getCurrentUserId();
    if (userId == null) {
      return Failure(data: null, message: "未ログインユーザー");
    }
    final result = await _eventRepository.deleteFavoriteEvent(userId, event);
    if (result is Success) {
      return await getFavoriteEvents();
    }
    return Failure(data: null, message: result.message);
  }

  Future<bool> logOut() async {
    startLoading();
    final result = await _authRepository.logOut();
    if (result is Success) {
      endLoading();
      return true;
    } else {
      endLoading();
      return false;
    }
  }
}
