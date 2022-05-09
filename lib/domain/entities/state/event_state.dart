import '../event.dart';
import 'package:flutter/cupertino.dart';

@immutable
class EventState {
  const EventState({this.isLoading = false, required this.events});

  final bool isLoading;
  final List<Event?> events;

  EventState copy({bool? isLoading, List<Event?>? events}) => EventState(
        isLoading: isLoading ?? this.isLoading,
        events: events ?? this.events,
      );
}
