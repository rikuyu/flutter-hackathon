
import '../../data/utils/utils.dart';
import '../entities/favorite_event.dart';

abstract class EventRepository {
  Future<Result> getEvents();

  Future<Result> addFavoriteEvent(String userId, FavoriteEvent event);
}