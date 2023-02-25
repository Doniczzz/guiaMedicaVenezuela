// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datos_personales_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DatosPersonalesStruct> _$datosPersonalesStructSerializer =
    new _$DatosPersonalesStructSerializer();

class _$DatosPersonalesStructSerializer
    implements StructuredSerializer<DatosPersonalesStruct> {
  @override
  final Iterable<Type> types = const [
    DatosPersonalesStruct,
    _$DatosPersonalesStruct
  ];
  @override
  final String wireName = 'DatosPersonalesStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DatosPersonalesStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.telefono;
    if (value != null) {
      result
        ..add('telefono')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cedula;
    if (value != null) {
      result
        ..add('cedula')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DatosPersonalesStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DatosPersonalesStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'telefono':
          result.telefono = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cedula':
          result.cedula = serializers.deserialize(value,
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

class _$DatosPersonalesStruct extends DatosPersonalesStruct {
  @override
  final String? telefono;
  @override
  final String? cedula;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DatosPersonalesStruct(
          [void Function(DatosPersonalesStructBuilder)? updates]) =>
      (new DatosPersonalesStructBuilder()..update(updates))._build();

  _$DatosPersonalesStruct._(
      {this.telefono, this.cedula, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DatosPersonalesStruct', 'firestoreUtilData');
  }

  @override
  DatosPersonalesStruct rebuild(
          void Function(DatosPersonalesStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DatosPersonalesStructBuilder toBuilder() =>
      new DatosPersonalesStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DatosPersonalesStruct &&
        telefono == other.telefono &&
        cedula == other.cedula &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, telefono.hashCode), cedula.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DatosPersonalesStruct')
          ..add('telefono', telefono)
          ..add('cedula', cedula)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DatosPersonalesStructBuilder
    implements Builder<DatosPersonalesStruct, DatosPersonalesStructBuilder> {
  _$DatosPersonalesStruct? _$v;

  String? _telefono;
  String? get telefono => _$this._telefono;
  set telefono(String? telefono) => _$this._telefono = telefono;

  String? _cedula;
  String? get cedula => _$this._cedula;
  set cedula(String? cedula) => _$this._cedula = cedula;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DatosPersonalesStructBuilder() {
    DatosPersonalesStruct._initializeBuilder(this);
  }

  DatosPersonalesStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _telefono = $v.telefono;
      _cedula = $v.cedula;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DatosPersonalesStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DatosPersonalesStruct;
  }

  @override
  void update(void Function(DatosPersonalesStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DatosPersonalesStruct build() => _build();

  _$DatosPersonalesStruct _build() {
    final _$result = _$v ??
        new _$DatosPersonalesStruct._(
            telefono: telefono,
            cedula: cedula,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'DatosPersonalesStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
