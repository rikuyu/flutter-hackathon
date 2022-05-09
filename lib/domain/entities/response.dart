import 'package:freezed_annotation/freezed_annotation.dart';

import 'event.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
class Response with _$Response {
  const factory Response({
    required int count,
    required int start,
    required int limit,
    required List<Event> events,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}
