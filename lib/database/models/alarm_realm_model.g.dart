// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class AlarmRealmModel extends _AlarmRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  AlarmRealmModel(
    String id,
    String label,
    double radius,
    String triggerOn, {
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
  Stream<RealmObjectChanges<AlarmRealmModel>> get changes =>
      RealmObjectBase.getChanges<AlarmRealmModel>(this);

  @override
  AlarmRealmModel freeze() =>
      RealmObjectBase.freezeObject<AlarmRealmModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(AlarmRealmModel._);
    return const SchemaObject(
        ObjectType.realmObject, AlarmRealmModel, 'AlarmRealmModel', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('label', RealmPropertyType.string),
      SchemaProperty('coordinates', RealmPropertyType.object,
          optional: true, linkTarget: 'CoordinatesRealmModel'),
      SchemaProperty('radius', RealmPropertyType.double),
      SchemaProperty('triggerOn', RealmPropertyType.string),
      SchemaProperty('isActive', RealmPropertyType.bool),
    ]);
  }
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

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CoordinatesRealmModel._);
    return const SchemaObject(ObjectType.realmObject, CoordinatesRealmModel,
        'CoordinatesRealmModel', [
      SchemaProperty('latitude', RealmPropertyType.double),
      SchemaProperty('longitude', RealmPropertyType.double),
    ]);
  }
}
