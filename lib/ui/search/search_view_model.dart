import 'package:flutter_hackathon/data/repository/event_repository_impl.dart';
import 'package:flutter_hackathon/domain/repository/event_respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/utils/utils.dart';
import '../../domain/entities/event.dart';
import '../../domain/entities/state/search_state.dart';

final searchViewModelProvider =
    StateNotifierProvider<SearchViewModel, SearchState>((ref) =>
        SearchViewModel(eventRepository: ref.read(eventRepositoryProvider)));

class SearchViewModel extends StateNotifier<SearchState> {
  SearchViewModel({required EventRepository eventRepository})
      : _eventRepository = eventRepository,
        super(const SearchState(events: [])) {
    getEvents();
  }

  final EventRepository _eventRepository;

  void startLoading() => state = state.copy(isLoading: true);

  void endLoading() => state = state.copy(isLoading: false);

  void setEvents(List<Event?> events) => state = state.copy(events: events);

  void setEventPrefecture(int p) => state = state.copy(prefecture: p);

  Future<Result> getEvents() async {
    startLoading();
    final response = await _eventRepository.getEvents(state.prefecture);
    if (response is Success) {
      final List<Event?> events = response.data;
      final result = Success(data: state.prefecture, message: response.message);
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
