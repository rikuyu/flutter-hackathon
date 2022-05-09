import 'package:flutter_hackathon/data/utils/utils.dart';
import 'package:flutter_hackathon/domain/data_source/remote/event_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/event_respository.dart';
import '../remote/event_data_source_impl.dart';

final eventRepositoryProvider = Provider((ref) =>
    EventRepositoryImpl(eventDataSource: ref.read(eventDataSourceProvider)));

class EventRepositoryImpl implements EventRepository {
  EventRepositoryImpl({required EventDataSource eventDataSource})
      : _eventDataSource = eventDataSource;

  final EventDataSource _eventDataSource;

  @override
  Future<Result> getEvents() async => await _eventDataSource.getEvents();
}
