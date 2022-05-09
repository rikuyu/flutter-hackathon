import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/event_repository_impl.dart';
import '../../data/utils/utils.dart';
import '../../domain/entities/event.dart';
import '../../domain/entities/state/event_state.dart';
import '../../domain/repository/event_respository.dart';

final eventViewModelProvider =
    StateNotifierProvider<EventViewModel, EventState>(
        (ref) => EventViewModel(repository: ref.read(eventRepositoryProvider)));

class EventViewModel extends StateNotifier<EventState> {
  EventViewModel({required EventRepository repository})
      : _repository = repository,
        super(const EventState(events: [])) {
    getEvents();
  }

  final EventRepository _repository;

  void startLoading() => state = state.copy(isLoading: true);

  void endLoading() => state = state.copy(isLoading: false);

  void setEvents(List<Event?> events) => state = state.copy(events: events);

  Future<Result> getEvents() async {
    startLoading();
    final response = await _repository.getEvents();
    if (response is Success) {
      final List<Event?> events = response.data;
      final result = Success(data: events, message: response.message);
      endLoading();
      print("Success");
      print(events.length);
      print(events.last);
      return result;
    } else {
      final result = Failure(data: null, message: response.message);
      endLoading();
      print("Failure");
      print(result.data);
      return result;
    }
  }
}
