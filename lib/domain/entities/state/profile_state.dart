import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hackathon/domain/entities/favorite_event.dart';

@immutable
class ProfileState {
  const ProfileState(
      {this.isLoading = false,
      required this.events,
      this.name = "",
      this.description = "",
      this.imageFile,
      this.imageUrl});

  final bool isLoading;
  final List<FavoriteEvent> events;
  final String name;
  final String description;
  final File? imageFile;
  final String? imageUrl;

  ProfileState copy(
          {bool? isLoading,
          List<FavoriteEvent>? events,
          String? name,
          String? description,
          File? imageFile,
          String? imageUrl}) =>
      ProfileState(
          isLoading: isLoading ?? this.isLoading,
          events: events ?? this.events,
          name: name ?? this.name,
          description: description ?? this.description,
          imageFile: imageFile ?? this.imageFile,
          imageUrl: imageUrl ?? this.imageUrl);
}
