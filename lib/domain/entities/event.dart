import 'package:flutter_hackathon/domain/entities/ticket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event(
      {required String eventId,
      required String title,
      required String summary,
      required String contents,
      required String imagePath,
      required String startedAt,
      required String endedAt,
      required String openedAt,
      required String entryStartedAt,
      required String entryEndedAt,
      required String cancelAt,
      required String capacity,
      required String url,
      required List<String> paymentTypes,
      required List<Ticket> tickets,
      required String cancelPolicy,
      required String prefectureId,
      required String address,
      required String place,
      required String lat,
      required String lng,
      required int accepted,
      required int waiting,
      required List<String> categories,
      required List<Owner> owners,
      required String embedCode,
      required String updatedAt}) = _Event;

   factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
