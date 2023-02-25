// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuentas_bancarias_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CuentasBancariasStruct> _$cuentasBancariasStructSerializer =
    new _$CuentasBancariasStructSerializer();

class _$CuentasBancariasStructSerializer
    implements StructuredSerializer<CuentasBancariasStruct> {
  @override
  final Iterable<Type> types = const [
    CuentasBancariasStruct,
    _$CuentasBancariasStruct
  ];
  @override
  final String wireName = 'CuentasBancariasStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CuentasBancariasStruct object,
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
        ..add('Nombre')
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
    value = object.numeroCuenta;
    if (value != null) {
      result
        ..add('numeroCuenta')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.banco;
    if (value != null) {
      result
        ..add('banco')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CuentasBancariasStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CuentasBancariasStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Nombre':
          result.nombre = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cedula':
          result.cedula = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numeroCuenta':
          result.numeroCuenta = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'banco':
          result.banco = serializers.deserialize(value,
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

class _$CuentasBancariasStruct extends CuentasBancariasStruct {
  @override
  final String? nombre;
  @override
  final String? cedula;
  @override
  final int? numeroCuenta;
  @override
  final String? banco;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$CuentasBancariasStruct(
          [void Function(CuentasBancariasStructBuilder)? updates]) =>
      (new CuentasBancariasStructBuilder()..update(updates))._build();

  _$CuentasBancariasStruct._(
      {this.nombre,
      this.cedula,
      this.numeroCuenta,
      this.banco,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'CuentasBancariasStruct', 'firestoreUtilData');
  }

  @override
  CuentasBancariasStruct rebuild(
          void Function(CuentasBancariasStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CuentasBancariasStructBuilder toBuilder() =>
      new CuentasBancariasStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CuentasBancariasStruct &&
        nombre == other.nombre &&
        cedula == other.cedula &&
        numeroCuenta == other.numeroCuenta &&
        banco == other.banco &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, nombre.hashCode), cedula.hashCode),
                numeroCuenta.hashCode),
            banco.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CuentasBancariasStruct')
          ..add('nombre', nombre)
          ..add('cedula', cedula)
          ..add('numeroCuenta', numeroCuenta)
          ..add('banco', banco)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class CuentasBancariasStructBuilder
    implements Builder<CuentasBancariasStruct, CuentasBancariasStructBuilder> {
  _$CuentasBancariasStruct? _$v;

  String? _nombre;
  String? get nombre => _$this._nombre;
  set nombre(String? nombre) => _$this._nombre = nombre;

  String? _cedula;
  String? get cedula => _$this._cedula;
  set cedula(String? cedula) => _$this._cedula = cedula;

  int? _numeroCuenta;
  int? get numeroCuenta => _$this._numeroCuenta;
  set numeroCuenta(int? numeroCuenta) => _$this._numeroCuenta = numeroCuenta;

  String? _banco;
  String? get banco => _$this._banco;
  set banco(String? banco) => _$this._banco = banco;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  CuentasBancariasStructBuilder() {
    CuentasBancariasStruct._initializeBuilder(this);
  }

  CuentasBancariasStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nombre = $v.nombre;
      _cedula = $v.cedula;
      _numeroCuenta = $v.numeroCuenta;
      _banco = $v.banco;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CuentasBancariasStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CuentasBancariasStruct;
  }

  @override
  void update(void Function(CuentasBancariasStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CuentasBancariasStruct build() => _build();

  _$CuentasBancariasStruct _build() {
    final _$result = _$v ??
        new _$CuentasBancariasStruct._(
            nombre: nombre,
            cedula: cedula,
            numeroCuenta: numeroCuenta,
            banco: banco,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'CuentasBancariasStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
