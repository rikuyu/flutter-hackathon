

import 'package:flutter_hackathon/domain/entities/favorite_event.dart';

import '../../../data/utils/utils.dart';

abstract class EventDataSource {
  Future<Result> getEvents(int prefecture);

  Future<Result> addFavoriteEvent(String userId, FavoriteEvent event);

  Future<Result> getFavoriteEvents(String userId);

  Future<Result> deleteFavoriteEvent(String userId, FavoriteEvent event);
}