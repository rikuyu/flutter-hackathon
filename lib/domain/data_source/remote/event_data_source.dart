

import 'package:flutter_hackathon/domain/entities/favorite_event.dart';

import '../../../data/utils/utils.dart';

abstract class EventDataSource {
  Future<Result> getEvents();

  Future<Result> addFavoriteEvent(String userId, FavoriteEvent event);
}