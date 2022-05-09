import 'package:flutter_hackathon/domain/entities/ticket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner.dart';

part 'event.freezed.dart';

part 'event.g.dart';

@freezed
class Event with _$Event {
  @JsonSerializable(explicitToJson: true)
  const factory Event(
      {String? eventId,
      String? title,
      String? summary,
      String? contents,
      @JsonKey(name: 'image_path') String? imagePath,
      @JsonKey(name: 'started_at') String? startedAt,
      @JsonKey(name: 'ended_at') String? endedAt,
      @JsonKey(name: 'opened_at') String? openedAt,
      @JsonKey(name: 'entry_started_at') String? entryStartedAt,
      @JsonKey(name: 'entry_ended_at') String? entryEndedAt,
      @JsonKey(name: 'cancel_at') String? cancelAt,
      String? capacity,
      String? url,
      @JsonKey(name: 'payment_types') List<String?>? paymentTypes,
      List<Ticket?>? tickets,
      @JsonKey(name: 'cancel_policy') String? cancelPolicy,
      String? prefectureId,
      String? address,
      String? place,
      String? lat,
      String? lng,
      int? accepted,
      int? waiting,
      List<String?>? categories,
      List<Owner?>? owners,
      String? embedCode,
      String? updatedAt}) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
