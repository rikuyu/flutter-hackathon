import 'package:flutter/cupertino.dart';

import '../event.dart';

@immutable
class SearchState {
  const SearchState(
      {this.isLoading = false, required this.events, this.prefecture = 27});

  final bool isLoading;
  final List<Event?> events;
  final int prefecture;

  SearchState copy({bool? isLoading, List<Event?>? events, int? prefecture}) =>
      SearchState(
          isLoading: isLoading ?? this.isLoading,
          events: events ?? this.events,
          prefecture: prefecture ?? this.prefecture);
}
