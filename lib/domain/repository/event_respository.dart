
import '../../data/utils/utils.dart';

abstract class EventRepository {
  Future<Result> getEvents();
}