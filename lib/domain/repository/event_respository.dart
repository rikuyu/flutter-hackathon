
import '../../data/utils/utils.dart';
import '../entities/favorite_event.dart';

abstract class EventRepository {
  Future<Result> getEvents(int prefecture);

  Future<Result> addFavoriteEvent(String userId, FavoriteEvent event);

  Future<Result> getFavoriteEvents(String userId);

  Future<Result> deleteFavoriteEvent(String userId, FavoriteEvent event);
}