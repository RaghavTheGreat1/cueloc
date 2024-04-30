// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ringtone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ringtone _$RingtoneFromJson(Map<String, dynamic> json) {
  return _Ringtone.fromJson(json);
}

/// @nodoc
mixin _$Ringtone {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RingtoneCopyWith<Ringtone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RingtoneCopyWith<$Res> {
  factory $RingtoneCopyWith(Ringtone value, $Res Function(Ringtone) then) =
      _$RingtoneCopyWithImpl<$Res, Ringtone>;
  @useResult
  $Res call({String id, String title, String uri});
}

/// @nodoc
class _$RingtoneCopyWithImpl<$Res, $Val extends Ringtone>
    implements $RingtoneCopyWith<$Res> {
  _$RingtoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? uri = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RingtoneImplCopyWith<$Res>
    implements $RingtoneCopyWith<$Res> {
  factory _$$RingtoneImplCopyWith(
          _$RingtoneImpl value, $Res Function(_$RingtoneImpl) then) =
      __$$RingtoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String uri});
}

/// @nodoc
class __$$RingtoneImplCopyWithImpl<$Res>
    extends _$RingtoneCopyWithImpl<$Res, _$RingtoneImpl>
    implements _$$RingtoneImplCopyWith<$Res> {
  __$$RingtoneImplCopyWithImpl(
      _$RingtoneImpl _value, $Res Function(_$RingtoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? uri = null,
  }) {
    return _then(_$RingtoneImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RingtoneImpl implements _Ringtone {
  _$RingtoneImpl({required this.id, required this.title, required this.uri});

  factory _$RingtoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$RingtoneImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String uri;

  @override
  String toString() {
    return 'Ringtone(id: $id, title: $title, uri: $uri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RingtoneImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RingtoneImplCopyWith<_$RingtoneImpl> get copyWith =>
      __$$RingtoneImplCopyWithImpl<_$RingtoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RingtoneImplToJson(
      this,
    );
  }
}

abstract class _Ringtone implements Ringtone {
  factory _Ringtone(
      {required final String id,
      required final String title,
      required final String uri}) = _$RingtoneImpl;

  factory _Ringtone.fromJson(Map<String, dynamic> json) =
      _$RingtoneImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get uri;
  @override
  @JsonKey(ignore: true)
  _$$RingtoneImplCopyWith<_$RingtoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
