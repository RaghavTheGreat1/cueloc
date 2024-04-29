// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alarm_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlarmForm _$AlarmFormFromJson(Map<String, dynamic> json) {
  return _AlarmForm.fromJson(json);
}

/// @nodoc
mixin _$AlarmForm {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Coordinates get coordinates => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;
  TriggerOn get triggerOn => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlarmFormCopyWith<AlarmForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlarmFormCopyWith<$Res> {
  factory $AlarmFormCopyWith(AlarmForm value, $Res Function(AlarmForm) then) =
      _$AlarmFormCopyWithImpl<$Res, AlarmForm>;
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
class _$AlarmFormCopyWithImpl<$Res, $Val extends AlarmForm>
    implements $AlarmFormCopyWith<$Res> {
  _$AlarmFormCopyWithImpl(this._value, this._then);

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
abstract class _$$AlarmFormImplCopyWith<$Res>
    implements $AlarmFormCopyWith<$Res> {
  factory _$$AlarmFormImplCopyWith(
          _$AlarmFormImpl value, $Res Function(_$AlarmFormImpl) then) =
      __$$AlarmFormImplCopyWithImpl<$Res>;
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
class __$$AlarmFormImplCopyWithImpl<$Res>
    extends _$AlarmFormCopyWithImpl<$Res, _$AlarmFormImpl>
    implements _$$AlarmFormImplCopyWith<$Res> {
  __$$AlarmFormImplCopyWithImpl(
      _$AlarmFormImpl _value, $Res Function(_$AlarmFormImpl) _then)
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
    return _then(_$AlarmFormImpl(
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
@JsonSerializable()
class _$AlarmFormImpl extends _AlarmForm {
  const _$AlarmFormImpl(
      {required this.id,
      required this.label,
      required this.coordinates,
      required this.radius,
      required this.triggerOn,
      required this.isActive})
      : super._();

  factory _$AlarmFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlarmFormImplFromJson(json);

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
    return 'AlarmForm(id: $id, label: $label, coordinates: $coordinates, radius: $radius, triggerOn: $triggerOn, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlarmFormImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, label, coordinates, radius, triggerOn, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlarmFormImplCopyWith<_$AlarmFormImpl> get copyWith =>
      __$$AlarmFormImplCopyWithImpl<_$AlarmFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlarmFormImplToJson(
      this,
    );
  }
}

abstract class _AlarmForm extends AlarmForm {
  const factory _AlarmForm(
      {required final String id,
      required final String label,
      required final Coordinates coordinates,
      required final double radius,
      required final TriggerOn triggerOn,
      required final bool isActive}) = _$AlarmFormImpl;
  const _AlarmForm._() : super._();

  factory _AlarmForm.fromJson(Map<String, dynamic> json) =
      _$AlarmFormImpl.fromJson;

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
  _$$AlarmFormImplCopyWith<_$AlarmFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
