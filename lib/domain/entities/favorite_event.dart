import 'package:flutter_hackathon/domain/entities/event.dart';

class FavoriteEvent {
  final String? id;
  final String? title;
  final String? summary;
  final String? imagePath;
  final String? startedAt;
  final String? address;

  FavoriteEvent({
    required this.id,
    required this.title,
    required this.summary,
    required this.imagePath,
    required this.startedAt,
    required this.address,
  });

  static FavoriteEvent convertToFavoriteEvent(Event event) => FavoriteEvent(
      id: event.eventId,
      title: event.title,
      summary: event.summary,
      imagePath: event.imagePath,
      startedAt: event.startedAt,
      address: event.address);

  FavoriteEvent.fromJson(Map<String, dynamic> json, String eventId)
      : this(
          id: eventId,
          title: json['title'] as String,
          summary: json['summary'] as String,
          imagePath: json['imagePath'] as String,
          startedAt: json['startedAt'] as String,
          address: json['address'] as String,
        );

  static Map<String, dynamic> toMap(FavoriteEvent event) => {
        "id": event.id,
        "title": event.title,
        "summary": event.summary,
        "imagePath": event.imagePath,
        "startedAt": event.startedAt,
        "address": event.address,
      };
}
