import 'package:flutter/cupertino.dart';
import 'package:flutter_hackathon/domain/entities/favorite_event.dart';

@immutable
class ProfileState {
  const ProfileState({this.isLoading = false, required this.events});

  final bool isLoading;
  final List<FavoriteEvent> events;

  ProfileState copy({bool? isLoading, List<FavoriteEvent>? events}) =>
      ProfileState(
        isLoading: isLoading ?? this.isLoading,
        events: events ?? this.events,
      );
}
