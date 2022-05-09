// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Response _$$_ResponseFromJson(Map<String, dynamic> json) => _$_Response(
      count: json['count'] as int?,
      start: json['start'] as int?,
      limit: json['limit'] as int?,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResponseToJson(_$_Response instance) =>
    <String, dynamic>{
      'count': instance.count,
      'start': instance.start,
      'limit': instance.limit,
      'events': instance.events?.map((e) => e?.toJson()).toList(),
    };
