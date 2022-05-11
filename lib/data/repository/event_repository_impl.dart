import 'package:flutter_hackathon/data/utils/utils.dart';
import 'package:flutter_hackathon/domain/data_source/remote/event_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/favorite_event.dart';
import '../../domain/repository/event_respository.dart';
import '../remote/event_data_source_impl.dart';

final eventRepositoryProvider = Provider((ref) =>
    EventRepositoryImpl(eventDataSource: ref.read(eventDataSourceProvider)));

class EventRepositoryImpl implements EventRepository {
  EventRepositoryImpl({required EventDataSource eventDataSource})
      : _eventDataSource = eventDataSource;

  final EventDataSource _eventDataSource;

  @override
  Future<Result> getEvents(int prefecture) async =>
      await _eventDataSource.getEvents(prefecture);

  @override
  Future<Result> addFavoriteEvent(String userId, FavoriteEvent event) async =>
      await _eventDataSource.addFavoriteEvent(userId, event);

  @override
  Future<Result> getFavoriteEvents(String userId) async =>
      await _eventDataSource.getFavoriteEvents(userId);

  @override
  Future<Result> deleteFavoriteEvent(
          String userId, FavoriteEvent event) async =>
      await _eventDataSource.deleteFavoriteEvent(userId, event);
}
