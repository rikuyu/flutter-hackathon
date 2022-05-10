// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  @JsonKey(name: 'event_id')
  String? get eventId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  String? get contents => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_path')
  String? get imagePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  String? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ended_at')
  String? get endedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'opened_at')
  String? get openedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_started_at')
  String? get entryStartedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_ended_at')
  String? get entryEndedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_at')
  String? get cancelAt => throw _privateConstructorUsedError;
  String? get capacity => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_types')
  List<String?>? get paymentTypes => throw _privateConstructorUsedError;
  List<Ticket?>? get tickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_policy')
  String? get cancelPolicy => throw _privateConstructorUsedError;
  String? get prefectureId => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get place => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get lng => throw _privateConstructorUsedError;
  int? get accepted => throw _privateConstructorUsedError;
  int? get waiting => throw _privateConstructorUsedError;
  List<String?>? get categories => throw _privateConstructorUsedError;
  List<Owner?>? get owners => throw _privateConstructorUsedError;
  String? get embedCode => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'event_id') String? eventId,
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
      String? updatedAt});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? eventId = freezed,
    Object? title = freezed,
    Object? summary = freezed,
    Object? contents = freezed,
    Object? imagePath = freezed,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? openedAt = freezed,
    Object? entryStartedAt = freezed,
    Object? entryEndedAt = freezed,
    Object? cancelAt = freezed,
    Object? capacity = freezed,
    Object? url = freezed,
    Object? paymentTypes = freezed,
    Object? tickets = freezed,
    Object? cancelPolicy = freezed,
    Object? prefectureId = freezed,
    Object? address = freezed,
    Object? place = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? accepted = freezed,
    Object? waiting = freezed,
    Object? categories = freezed,
    Object? owners = freezed,
    Object? embedCode = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: startedAt == freezed
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endedAt: endedAt == freezed
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      openedAt: openedAt == freezed
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      entryStartedAt: entryStartedAt == freezed
          ? _value.entryStartedAt
          : entryStartedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      entryEndedAt: entryEndedAt == freezed
          ? _value.entryEndedAt
          : entryEndedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelAt: cancelAt == freezed
          ? _value.cancelAt
          : cancelAt // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: capacity == freezed
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTypes: paymentTypes == freezed
          ? _value.paymentTypes
          : paymentTypes // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      tickets: tickets == freezed
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket?>?,
      cancelPolicy: cancelPolicy == freezed
          ? _value.cancelPolicy
          : cancelPolicy // ignore: cast_nullable_to_non_nullable
              as String?,
      prefectureId: prefectureId == freezed
          ? _value.prefectureId
          : prefectureId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as int?,
      waiting: waiting == freezed
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      owners: owners == freezed
          ? _value.owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<Owner?>?,
      embedCode: embedCode == freezed
          ? _value.embedCode
          : embedCode // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'event_id') String? eventId,
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
      String? updatedAt});
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, (v) => _then(v as _$_Event));

  @override
  _$_Event get _value => super._value as _$_Event;

  @override
  $Res call({
    Object? eventId = freezed,
    Object? title = freezed,
    Object? summary = freezed,
    Object? contents = freezed,
    Object? imagePath = freezed,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? openedAt = freezed,
    Object? entryStartedAt = freezed,
    Object? entryEndedAt = freezed,
    Object? cancelAt = freezed,
    Object? capacity = freezed,
    Object? url = freezed,
    Object? paymentTypes = freezed,
    Object? tickets = freezed,
    Object? cancelPolicy = freezed,
    Object? prefectureId = freezed,
    Object? address = freezed,
    Object? place = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? accepted = freezed,
    Object? waiting = freezed,
    Object? categories = freezed,
    Object? owners = freezed,
    Object? embedCode = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Event(
      eventId: eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: summary == freezed
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      contents: contents == freezed
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      startedAt: startedAt == freezed
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endedAt: endedAt == freezed
          ? _value.endedAt
          : endedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      openedAt: openedAt == freezed
          ? _value.openedAt
          : openedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      entryStartedAt: entryStartedAt == freezed
          ? _value.entryStartedAt
          : entryStartedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      entryEndedAt: entryEndedAt == freezed
          ? _value.entryEndedAt
          : entryEndedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelAt: cancelAt == freezed
          ? _value.cancelAt
          : cancelAt // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: capacity == freezed
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTypes: paymentTypes == freezed
          ? _value._paymentTypes
          : paymentTypes // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      tickets: tickets == freezed
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<Ticket?>?,
      cancelPolicy: cancelPolicy == freezed
          ? _value.cancelPolicy
          : cancelPolicy // ignore: cast_nullable_to_non_nullable
              as String?,
      prefectureId: prefectureId == freezed
          ? _value.prefectureId
          : prefectureId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: lng == freezed
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as int?,
      waiting: waiting == freezed
          ? _value.waiting
          : waiting // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      owners: owners == freezed
          ? _value._owners
          : owners // ignore: cast_nullable_to_non_nullable
              as List<Owner?>?,
      embedCode: embedCode == freezed
          ? _value.embedCode
          : embedCode // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Event implements _Event {
  const _$_Event(
      {@JsonKey(name: 'event_id') this.eventId,
      this.title,
      this.summary,
      this.contents,
      @JsonKey(name: 'image_path') this.imagePath,
      @JsonKey(name: 'started_at') this.startedAt,
      @JsonKey(name: 'ended_at') this.endedAt,
      @JsonKey(name: 'opened_at') this.openedAt,
      @JsonKey(name: 'entry_started_at') this.entryStartedAt,
      @JsonKey(name: 'entry_ended_at') this.entryEndedAt,
      @JsonKey(name: 'cancel_at') this.cancelAt,
      this.capacity,
      this.url,
      @JsonKey(name: 'payment_types') final List<String?>? paymentTypes,
      final List<Ticket?>? tickets,
      @JsonKey(name: 'cancel_policy') this.cancelPolicy,
      this.prefectureId,
      this.address,
      this.place,
      this.lat,
      this.lng,
      this.accepted,
      this.waiting,
      final List<String?>? categories,
      final List<Owner?>? owners,
      this.embedCode,
      this.updatedAt})
      : _paymentTypes = paymentTypes,
        _tickets = tickets,
        _categories = categories,
        _owners = owners;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  @JsonKey(name: 'event_id')
  final String? eventId;
  @override
  final String? title;
  @override
  final String? summary;
  @override
  final String? contents;
  @override
  @JsonKey(name: 'image_path')
  final String? imagePath;
  @override
  @JsonKey(name: 'started_at')
  final String? startedAt;
  @override
  @JsonKey(name: 'ended_at')
  final String? endedAt;
  @override
  @JsonKey(name: 'opened_at')
  final String? openedAt;
  @override
  @JsonKey(name: 'entry_started_at')
  final String? entryStartedAt;
  @override
  @JsonKey(name: 'entry_ended_at')
  final String? entryEndedAt;
  @override
  @JsonKey(name: 'cancel_at')
  final String? cancelAt;
  @override
  final String? capacity;
  @override
  final String? url;
  final List<String?>? _paymentTypes;
  @override
  @JsonKey(name: 'payment_types')
  List<String?>? get paymentTypes {
    final value = _paymentTypes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Ticket?>? _tickets;
  @override
  List<Ticket?>? get tickets {
    final value = _tickets;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'cancel_policy')
  final String? cancelPolicy;
  @override
  final String? prefectureId;
  @override
  final String? address;
  @override
  final String? place;
  @override
  final String? lat;
  @override
  final String? lng;
  @override
  final int? accepted;
  @override
  final int? waiting;
  final List<String?>? _categories;
  @override
  List<String?>? get categories {
    final value = _categories;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Owner?>? _owners;
  @override
  List<Owner?>? get owners {
    final value = _owners;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? embedCode;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Event(eventId: $eventId, title: $title, summary: $summary, contents: $contents, imagePath: $imagePath, startedAt: $startedAt, endedAt: $endedAt, openedAt: $openedAt, entryStartedAt: $entryStartedAt, entryEndedAt: $entryEndedAt, cancelAt: $cancelAt, capacity: $capacity, url: $url, paymentTypes: $paymentTypes, tickets: $tickets, cancelPolicy: $cancelPolicy, prefectureId: $prefectureId, address: $address, place: $place, lat: $lat, lng: $lng, accepted: $accepted, waiting: $waiting, categories: $categories, owners: $owners, embedCode: $embedCode, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            const DeepCollectionEquality().equals(other.eventId, eventId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.summary, summary) &&
            const DeepCollectionEquality().equals(other.contents, contents) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.startedAt, startedAt) &&
            const DeepCollectionEquality().equals(other.endedAt, endedAt) &&
            const DeepCollectionEquality().equals(other.openedAt, openedAt) &&
            const DeepCollectionEquality()
                .equals(other.entryStartedAt, entryStartedAt) &&
            const DeepCollectionEquality()
                .equals(other.entryEndedAt, entryEndedAt) &&
            const DeepCollectionEquality().equals(other.cancelAt, cancelAt) &&
            const DeepCollectionEquality().equals(other.capacity, capacity) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other._paymentTypes, _paymentTypes) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            const DeepCollectionEquality()
                .equals(other.cancelPolicy, cancelPolicy) &&
            const DeepCollectionEquality()
                .equals(other.prefectureId, prefectureId) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.place, place) &&
            const DeepCollectionEquality().equals(other.lat, lat) &&
            const DeepCollectionEquality().equals(other.lng, lng) &&
            const DeepCollectionEquality().equals(other.accepted, accepted) &&
            const DeepCollectionEquality().equals(other.waiting, waiting) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._owners, _owners) &&
            const DeepCollectionEquality().equals(other.embedCode, embedCode) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(eventId),
        const DeepCollectionEquality().hash(title),
        const DeepCollectionEquality().hash(summary),
        const DeepCollectionEquality().hash(contents),
        const DeepCollectionEquality().hash(imagePath),
        const DeepCollectionEquality().hash(startedAt),
        const DeepCollectionEquality().hash(endedAt),
        const DeepCollectionEquality().hash(openedAt),
        const DeepCollectionEquality().hash(entryStartedAt),
        const DeepCollectionEquality().hash(entryEndedAt),
        const DeepCollectionEquality().hash(cancelAt),
        const DeepCollectionEquality().hash(capacity),
        const DeepCollectionEquality().hash(url),
        const DeepCollectionEquality().hash(_paymentTypes),
        const DeepCollectionEquality().hash(_tickets),
        const DeepCollectionEquality().hash(cancelPolicy),
        const DeepCollectionEquality().hash(prefectureId),
        const DeepCollectionEquality().hash(address),
        const DeepCollectionEquality().hash(place),
        const DeepCollectionEquality().hash(lat),
        const DeepCollectionEquality().hash(lng),
        const DeepCollectionEquality().hash(accepted),
        const DeepCollectionEquality().hash(waiting),
        const DeepCollectionEquality().hash(_categories),
        const DeepCollectionEquality().hash(_owners),
        const DeepCollectionEquality().hash(embedCode),
        const DeepCollectionEquality().hash(updatedAt)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(this);
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {@JsonKey(name: 'event_id') final String? eventId,
      final String? title,
      final String? summary,
      final String? contents,
      @JsonKey(name: 'image_path') final String? imagePath,
      @JsonKey(name: 'started_at') final String? startedAt,
      @JsonKey(name: 'ended_at') final String? endedAt,
      @JsonKey(name: 'opened_at') final String? openedAt,
      @JsonKey(name: 'entry_started_at') final String? entryStartedAt,
      @JsonKey(name: 'entry_ended_at') final String? entryEndedAt,
      @JsonKey(name: 'cancel_at') final String? cancelAt,
      final String? capacity,
      final String? url,
      @JsonKey(name: 'payment_types') final List<String?>? paymentTypes,
      final List<Ticket?>? tickets,
      @JsonKey(name: 'cancel_policy') final String? cancelPolicy,
      final String? prefectureId,
      final String? address,
      final String? place,
      final String? lat,
      final String? lng,
      final int? accepted,
      final int? waiting,
      final List<String?>? categories,
      final List<Owner?>? owners,
      final String? embedCode,
      final String? updatedAt}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  @JsonKey(name: 'event_id')
  String? get eventId => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get summary => throw _privateConstructorUsedError;
  @override
  String? get contents => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_path')
  String? get imagePath => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'started_at')
  String? get startedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'ended_at')
  String? get endedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'opened_at')
  String? get openedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'entry_started_at')
  String? get entryStartedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'entry_ended_at')
  String? get entryEndedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cancel_at')
  String? get cancelAt => throw _privateConstructorUsedError;
  @override
  String? get capacity => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'payment_types')
  List<String?>? get paymentTypes => throw _privateConstructorUsedError;
  @override
  List<Ticket?>? get tickets => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cancel_policy')
  String? get cancelPolicy => throw _privateConstructorUsedError;
  @override
  String? get prefectureId => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  String? get place => throw _privateConstructorUsedError;
  @override
  String? get lat => throw _privateConstructorUsedError;
  @override
  String? get lng => throw _privateConstructorUsedError;
  @override
  int? get accepted => throw _privateConstructorUsedError;
  @override
  int? get waiting => throw _privateConstructorUsedError;
  @override
  List<String?>? get categories => throw _privateConstructorUsedError;
  @override
  List<Owner?>? get owners => throw _privateConstructorUsedError;
  @override
  String? get embedCode => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}
