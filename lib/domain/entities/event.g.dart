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
      imagePath: json['imagePath'] as String?,
      startedAt: json['startedAt'] as String?,
      endedAt: json['endedAt'] as String?,
      openedAt: json['openedAt'] as String?,
      entryStartedAt: json['entryStartedAt'] as String?,
      entryEndedAt: json['entryEndedAt'] as String?,
      cancelAt: json['cancelAt'] as String?,
      capacity: json['capacity'] as String?,
      url: json['url'] as String?,
      paymentTypes: (json['paymentTypes'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      tickets: (json['tickets'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
      cancelPolicy: json['cancelPolicy'] as String?,
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
      'imagePath': instance.imagePath,
      'startedAt': instance.startedAt,
      'endedAt': instance.endedAt,
      'openedAt': instance.openedAt,
      'entryStartedAt': instance.entryStartedAt,
      'entryEndedAt': instance.entryEndedAt,
      'cancelAt': instance.cancelAt,
      'capacity': instance.capacity,
      'url': instance.url,
      'paymentTypes': instance.paymentTypes,
      'tickets': instance.tickets?.map((e) => e?.toJson()).toList(),
      'cancelPolicy': instance.cancelPolicy,
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
