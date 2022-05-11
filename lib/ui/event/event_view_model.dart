import 'package:flutter_hackathon/data/repository/user_respotiory_impl.dart';
import 'package:flutter_hackathon/domain/entities/favorite_event.dart';
import 'package:flutter_hackathon/domain/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/event_repository_impl.dart';
import '../../data/utils/utils.dart';
import '../../domain/entities/event.dart';
import '../../domain/entities/state/event_state.dart';
import '../../domain/repository/event_respository.dart';

final eventViewModelProvider =
    StateNotifierProvider<EventViewModel, EventState>((ref) => EventViewModel(
        eventRepository: ref.read(eventRepositoryProvider),
        authRepository: ref.read(userRepositoryProvider)));

class EventViewModel extends StateNotifier<EventState> {
  EventViewModel(
      {required EventRepository eventRepository,
      required UserRepository authRepository})
      : _eventRepository = eventRepository,
        _authRepository = authRepository,
        super(const EventState(events: [])) {
    getEvents();
  }

  final EventRepository _eventRepository;
  final UserRepository _authRepository;

  void startLoading() => state = state.copy(isLoading: true);

  void endLoading() => state = state.copy(isLoading: false);

  void setEvents(List<Event?> events) => state = state.copy(events: events);

  void setEventPrefecture(int p) => state = state.copy(prefecture: p);

  String? getCurrentUserId() {
    final result = _authRepository.getCurrentUserId();
    if (result is Success) {
      return result.data;
    } else {
      return null;
    }
  }

  Future<Result> addFavoriteEvent(Event event) async {
    final FavoriteEvent favoriteEvent =
        FavoriteEvent.convertToFavoriteEvent(event);
    final userId = getCurrentUserId();
    if (userId == null) {
      return Failure(data: null, message: "未ログインユーザー");
    }
    final result =
        await _eventRepository.addFavoriteEvent(userId, favoriteEvent);
    if (result is Success) {
      return Success(data: null, message: result.message);
    }
    return Failure(data: result.data, message: result.message);
  }

  Future<Result> getEvents() async {
    startLoading();
    final response = await _eventRepository.getEvents(state.prefecture);
    if (response is Success) {
      final List<Event?> events = response.data;
      final result = Success(data: events, message: response.message);
      setEvents(events);
      endLoading();
      return result;
    } else {
      final result = Failure(data: null, message: response.message);
      endLoading();
      return result;
    }
  }
}
