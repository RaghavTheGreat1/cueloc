// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlarmFormImpl _$$AlarmFormImplFromJson(Map<String, dynamic> json) =>
    _$AlarmFormImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      radius: (json['radius'] as num).toDouble(),
      triggerOn: $enumDecode(_$TriggerOnEnumMap, json['triggerOn']),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$AlarmFormImplToJson(_$AlarmFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'coordinates': instance.coordinates,
      'radius': instance.radius,
      'triggerOn': _$TriggerOnEnumMap[instance.triggerOn]!,
      'isActive': instance.isActive,
    };

const _$TriggerOnEnumMap = {
  TriggerOn.entry: 'entry',
  TriggerOn.exit: 'exit',
};
