import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner.freezed.dart';

part 'owner.g.dart';

@freezed
class Owner with _$Owner {
  @JsonSerializable(explicitToJson: true)
  const factory Owner({
    required String? id,
    required String? price,
    required String? url,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
