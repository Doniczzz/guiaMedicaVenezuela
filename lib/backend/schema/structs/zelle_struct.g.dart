// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zelle_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ZelleStruct> _$zelleStructSerializer = new _$ZelleStructSerializer();

class _$ZelleStructSerializer implements StructuredSerializer<ZelleStruct> {
  @override
  final Iterable<Type> types = const [ZelleStruct, _$ZelleStruct];
  @override
  final String wireName = 'ZelleStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ZelleStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.nombre;
    if (value != null) {
      result
        ..add('nombre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.correo;
    if (value != null) {
      result
        ..add('correo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ZelleStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ZelleStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nombre':
          result.nombre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'correo':
          result.correo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$ZelleStruct extends ZelleStruct {
  @override
  final String? nombre;
  @override
  final String? correo;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ZelleStruct([void Function(ZelleStructBuilder)? updates]) =>
      (new ZelleStructBuilder()..update(updates))._build();

  _$ZelleStruct._({this.nombre, this.correo, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ZelleStruct', 'firestoreUtilData');
  }

  @override
  ZelleStruct rebuild(void Function(ZelleStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ZelleStructBuilder toBuilder() => new ZelleStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ZelleStruct &&
        nombre == other.nombre &&
        correo == other.correo &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, nombre.hashCode), correo.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ZelleStruct')
          ..add('nombre', nombre)
          ..add('correo', correo)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ZelleStructBuilder implements Builder<ZelleStruct, ZelleStructBuilder> {
  _$ZelleStruct? _$v;

  String? _nombre;
  String? get nombre => _$this._nombre;
  set nombre(String? nombre) => _$this._nombre = nombre;

  String? _correo;
  String? get correo => _$this._correo;
  set correo(String? correo) => _$this._correo = correo;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ZelleStructBuilder() {
    ZelleStruct._initializeBuilder(this);
  }

  ZelleStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nombre = $v.nombre;
      _correo = $v.correo;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ZelleStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ZelleStruct;
  }

  @override
  void update(void Function(ZelleStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ZelleStruct build() => _build();

  _$ZelleStruct _build() {
    final _$result = _$v ??
        new _$ZelleStruct._(
            nombre: nombre,
            correo: correo,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'ZelleStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
