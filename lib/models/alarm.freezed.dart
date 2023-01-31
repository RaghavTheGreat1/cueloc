// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Alarm {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Coordinates get coordinates => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;
  TriggerOn get triggerOn => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlarmCopyWith<Alarm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmCopyWith<$Res> {
  factory $AlarmCopyWith(Alarm value, $Res Function(Alarm) then) =
      _$AlarmCopyWithImpl<$Res, Alarm>;
  @useResult
  $Res call(
      {String id,
      String label,
      Coordinates coordinates,
      double radius,
      TriggerOn triggerOn,
      bool isActive});

  $CoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class _$AlarmCopyWithImpl<$Res, $Val extends Alarm>
    implements $AlarmCopyWith<$Res> {
  _$AlarmCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? coordinates = null,
    Object? radius = null,
    Object? triggerOn = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      triggerOn: null == triggerOn
          ? _value.triggerOn
          : triggerOn // ignore: cast_nullable_to_non_nullable
              as TriggerOn,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res> get coordinates {
    return $CoordinatesCopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AlarmCopyWith<$Res> implements $AlarmCopyWith<$Res> {
  factory _$$_AlarmCopyWith(_$_Alarm value, $Res Function(_$_Alarm) then) =
      __$$_AlarmCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      Coordinates coordinates,
      double radius,
      TriggerOn triggerOn,
      bool isActive});

  @override
  $CoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class __$$_AlarmCopyWithImpl<$Res> extends _$AlarmCopyWithImpl<$Res, _$_Alarm>
    implements _$$_AlarmCopyWith<$Res> {
  __$$_AlarmCopyWithImpl(_$_Alarm _value, $Res Function(_$_Alarm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? coordinates = null,
    Object? radius = null,
    Object? triggerOn = null,
    Object? isActive = null,
  }) {
    return _then(_$_Alarm(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      triggerOn: null == triggerOn
          ? _value.triggerOn
          : triggerOn // ignore: cast_nullable_to_non_nullable
              as TriggerOn,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Alarm extends _Alarm {
  const _$_Alarm(
      {required this.id,
      required this.label,
      required this.coordinates,
      required this.radius,
      required this.triggerOn,
      required this.isActive})
      : super._();

  @override
  final String id;
  @override
  final String label;
  @override
  final Coordinates coordinates;
  @override
  final double radius;
  @override
  final TriggerOn triggerOn;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'Alarm(id: $id, label: $label, coordinates: $coordinates, radius: $radius, triggerOn: $triggerOn, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Alarm &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.radius, radius) || other.radius == radius) &&
            (identical(other.triggerOn, triggerOn) ||
                other.triggerOn == triggerOn) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, label, coordinates, radius, triggerOn, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlarmCopyWith<_$_Alarm> get copyWith =>
      __$$_AlarmCopyWithImpl<_$_Alarm>(this, _$identity);
}

abstract class _Alarm extends Alarm {
  const factory _Alarm(
      {required final String id,
      required final String label,
      required final Coordinates coordinates,
      required final double radius,
      required final TriggerOn triggerOn,
      required final bool isActive}) = _$_Alarm;
  const _Alarm._() : super._();

  @override
  String get id;
  @override
  String get label;
  @override
  Coordinates get coordinates;
  @override
  double get radius;
  @override
  TriggerOn get triggerOn;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_AlarmCopyWith<_$_Alarm> get copyWith =>
      throw _privateConstructorUsedError;
}
