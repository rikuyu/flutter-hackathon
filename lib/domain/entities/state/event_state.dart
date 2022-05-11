import 'package:flutter/cupertino.dart';

import '../event.dart';

@immutable
class EventState {
  const EventState(
      {this.isLoading = false, required this.events, this.prefecture = 0});

  final bool isLoading;
  final List<Event?> events;
  final int prefecture;

  EventState copy({bool? isLoading, List<Event?>? events, int? prefecture}) =>
      EventState(
        isLoading: isLoading ?? this.isLoading,
        events: events ?? this.events,
        prefecture: prefecture ?? this.prefecture,
      );
}
