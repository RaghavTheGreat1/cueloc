// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class AlarmRealmModel extends _AlarmRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  AlarmRealmModel(
    String id,
    String label,
    double radius,
    String triggerOn, {
    CoordinatesRealmModel? coordinates,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'label', label);
    RealmObjectBase.set(this, 'coordinates', coordinates);
    RealmObjectBase.set(this, 'radius', radius);
    RealmObjectBase.set(this, 'triggerOn', triggerOn);
  }

  AlarmRealmModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => throw RealmUnsupportedSetError();

  @override
  String get label => RealmObjectBase.get<String>(this, 'label') as String;
  @override
  set label(String value) => throw RealmUnsupportedSetError();

  @override
  CoordinatesRealmModel get coordinates =>
      RealmObjectBase.get<CoordinatesRealmModel>(this, 'coordinates')
          as CoordinatesRealmModel;
  @override
  set coordinates(covariant CoordinatesRealmModel value) =>
      throw RealmUnsupportedSetError();

  @override
  double get radius => RealmObjectBase.get<double>(this, 'radius') as double;
  @override
  set radius(double value) => throw RealmUnsupportedSetError();

  @override
  String get triggerOn =>
      RealmObjectBase.get<String>(this, 'triggerOn') as String;
  @override
  set triggerOn(String value) => throw RealmUnsupportedSetError();

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
  set latitude(double value) => throw RealmUnsupportedSetError();

  @override
  double get longitude =>
      RealmObjectBase.get<double>(this, 'longitude') as double;
  @override
  set longitude(double value) => throw RealmUnsupportedSetError();

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
