import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.freezed.dart';

part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  @JsonSerializable(explicitToJson: true)
  const factory Ticket({
    required String? name,
    required String? price,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}
