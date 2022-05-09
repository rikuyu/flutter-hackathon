

import '../../../data/utils/utils.dart';

abstract class EventDataSource {
  Future<Result> getEvents();
}