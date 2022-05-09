// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      eventId: json['eventId'] as String?,
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      contents: json['contents'] as String?,
      imagePath: json['image_path'] as String?,
      startedAt: json['started_at'] as String?,
      endedAt: json['ended_at'] as String?,
      openedAt: json['opened_at'] as String?,
      entryStartedAt: json['entry_started_at'] as String?,
      entryEndedAt: json['entry_ended_at'] as String?,
      cancelAt: json['cancel_at'] as String?,
      capacity: json['capacity'] as String?,
      url: json['url'] as String?,
      paymentTypes: (json['payment_types'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      tickets: (json['tickets'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
      cancelPolicy: json['cancel_policy'] as String?,
      prefectureId: json['prefectureId'] as String?,
      address: json['address'] as String?,
      place: json['place'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      accepted: json['accepted'] as int?,
      waiting: json['waiting'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      owners: (json['owners'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Owner.fromJson(e as Map<String, dynamic>))
          .toList(),
      embedCode: json['embedCode'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'eventId': instance.eventId,
      'title': instance.title,
      'summary': instance.summary,
      'contents': instance.contents,
      'image_path': instance.imagePath,
      'started_at': instance.startedAt,
      'ended_at': instance.endedAt,
      'opened_at': instance.openedAt,
      'entry_started_at': instance.entryStartedAt,
      'entry_ended_at': instance.entryEndedAt,
      'cancel_at': instance.cancelAt,
      'capacity': instance.capacity,
      'url': instance.url,
      'payment_types': instance.paymentTypes,
      'tickets': instance.tickets?.map((e) => e?.toJson()).toList(),
      'cancel_policy': instance.cancelPolicy,
      'prefectureId': instance.prefectureId,
      'address': instance.address,
      'place': instance.place,
      'lat': instance.lat,
      'lng': instance.lng,
      'accepted': instance.accepted,
      'waiting': instance.waiting,
      'categories': instance.categories,
      'owners': instance.owners?.map((e) => e?.toJson()).toList(),
      'embedCode': instance.embedCode,
      'updatedAt': instance.updatedAt,
    };
