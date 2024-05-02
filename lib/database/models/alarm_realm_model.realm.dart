// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class AlarmRealmModel extends _AlarmRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  AlarmRealmModel(
    String id,
    String label,
    double radius,
    String triggerOn,
    String notes, {
    CoordinatesRealmModel? coordinates,
    bool isActive = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<AlarmRealmModel>({
        'isActive': false,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'label', label);
    RealmObjectBase.set(this, 'coordinates', coordinates);
    RealmObjectBase.set(this, 'radius', radius);
    RealmObjectBase.set(this, 'triggerOn', triggerOn);
    RealmObjectBase.set(this, 'isActive', isActive);
    RealmObjectBase.set(this, 'notes', notes);
  }

  AlarmRealmModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get label => RealmObjectBase.get<String>(this, 'label') as String;
  @override
  set label(String value) => RealmObjectBase.set(this, 'label', value);

  @override
  CoordinatesRealmModel? get coordinates =>
      RealmObjectBase.get<CoordinatesRealmModel>(this, 'coordinates')
          as CoordinatesRealmModel?;
  @override
  set coordinates(covariant CoordinatesRealmModel? value) =>
      RealmObjectBase.set(this, 'coordinates', value);

  @override
  double get radius => RealmObjectBase.get<double>(this, 'radius') as double;
  @override
  set radius(double value) => RealmObjectBase.set(this, 'radius', value);

  @override
  String get triggerOn =>
      RealmObjectBase.get<String>(this, 'triggerOn') as String;
  @override
  set triggerOn(String value) => RealmObjectBase.set(this, 'triggerOn', value);

  @override
  bool get isActive => RealmObjectBase.get<bool>(this, 'isActive') as bool;
  @override
  set isActive(bool value) => RealmObjectBase.set(this, 'isActive', value);

  @override
  String get notes => RealmObjectBase.get<String>(this, 'notes') as String;
  @override
  set notes(String value) => RealmObjectBase.set(this, 'notes', value);

  @override
  Stream<RealmObjectChanges<AlarmRealmModel>> get changes =>
      RealmObjectBase.getChanges<AlarmRealmModel>(this);

  @override
  AlarmRealmModel freeze() =>
      RealmObjectBase.freezeObject<AlarmRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'label': label.toEJson(),
      'coordinates': coordinates.toEJson(),
      'radius': radius.toEJson(),
      'triggerOn': triggerOn.toEJson(),
      'isActive': isActive.toEJson(),
      'notes': notes.toEJson(),
    };
  }

  static EJsonValue _toEJson(AlarmRealmModel value) => value.toEJson();
  static AlarmRealmModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'label': EJsonValue label,
        'coordinates': EJsonValue coordinates,
        'radius': EJsonValue radius,
        'triggerOn': EJsonValue triggerOn,
        'isActive': EJsonValue isActive,
        'notes': EJsonValue notes,
      } =>
        AlarmRealmModel(
          fromEJson(id),
          fromEJson(label),
          fromEJson(radius),
          fromEJson(triggerOn),
          fromEJson(notes),
          coordinates: fromEJson(coordinates),
          isActive: fromEJson(isActive),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(AlarmRealmModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, AlarmRealmModel, 'AlarmRealmModel', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('label', RealmPropertyType.string),
      SchemaProperty('coordinates', RealmPropertyType.object,
          optional: true, linkTarget: 'CoordinatesRealmModel'),
      SchemaProperty('radius', RealmPropertyType.double),
      SchemaProperty('triggerOn', RealmPropertyType.string),
      SchemaProperty('isActive', RealmPropertyType.bool),
      SchemaProperty('notes', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class CoordinatesRealmModel extends _CoordinatesRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  CoordinatesRealmModel(
    double latitude,
    double longitude,
  ) {
    RealmObjectBase.set(this, 'latitude', latitude);
    RealmObjectBase.set(this, 'longitude', longitude);
  }

  CoordinatesRealmModel._();

  @override
  double get latitude =>
      RealmObjectBase.get<double>(this, 'latitude') as double;
  @override
  set latitude(double value) => RealmObjectBase.set(this, 'latitude', value);

  @override
  double get longitude =>
      RealmObjectBase.get<double>(this, 'longitude') as double;
  @override
  set longitude(double value) => RealmObjectBase.set(this, 'longitude', value);

  @override
  Stream<RealmObjectChanges<CoordinatesRealmModel>> get changes =>
      RealmObjectBase.getChanges<CoordinatesRealmModel>(this);

  @override
  CoordinatesRealmModel freeze() =>
      RealmObjectBase.freezeObject<CoordinatesRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'latitude': latitude.toEJson(),
      'longitude': longitude.toEJson(),
    };
  }

  static EJsonValue _toEJson(CoordinatesRealmModel value) => value.toEJson();
  static CoordinatesRealmModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'latitude': EJsonValue latitude,
        'longitude': EJsonValue longitude,
      } =>
        CoordinatesRealmModel(
          fromEJson(latitude),
          fromEJson(longitude),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CoordinatesRealmModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, CoordinatesRealmModel,
        'CoordinatesRealmModel', [
      SchemaProperty('latitude', RealmPropertyType.double),
      SchemaProperty('longitude', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
