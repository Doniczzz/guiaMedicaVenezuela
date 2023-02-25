// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagos_moviles_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PagosMovilesStruct> _$pagosMovilesStructSerializer =
    new _$PagosMovilesStructSerializer();

class _$PagosMovilesStructSerializer
    implements StructuredSerializer<PagosMovilesStruct> {
  @override
  final Iterable<Type> types = const [PagosMovilesStruct, _$PagosMovilesStruct];
  @override
  final String wireName = 'PagosMovilesStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PagosMovilesStruct object,
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
    value = object.telefono;
    if (value != null) {
      result
        ..add('telefono')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PagosMovilesStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PagosMovilesStructBuilder();

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
        case 'telefono':
          result.telefono = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PagosMovilesStruct extends PagosMovilesStruct {
  @override
  final String? nombre;
  @override
  final String? telefono;
  @override
  final String? banco;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PagosMovilesStruct(
          [void Function(PagosMovilesStructBuilder)? updates]) =>
      (new PagosMovilesStructBuilder()..update(updates))._build();

  _$PagosMovilesStruct._(
      {this.nombre, this.telefono, this.banco, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PagosMovilesStruct', 'firestoreUtilData');
  }

  @override
  PagosMovilesStruct rebuild(
          void Function(PagosMovilesStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagosMovilesStructBuilder toBuilder() =>
      new PagosMovilesStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PagosMovilesStruct &&
        nombre == other.nombre &&
        telefono == other.telefono &&
        banco == other.banco &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, nombre.hashCode), telefono.hashCode), banco.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PagosMovilesStruct')
          ..add('nombre', nombre)
          ..add('telefono', telefono)
          ..add('banco', banco)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PagosMovilesStructBuilder
    implements Builder<PagosMovilesStruct, PagosMovilesStructBuilder> {
  _$PagosMovilesStruct? _$v;

  String? _nombre;
  String? get nombre => _$this._nombre;
  set nombre(String? nombre) => _$this._nombre = nombre;

  String? _telefono;
  String? get telefono => _$this._telefono;
  set telefono(String? telefono) => _$this._telefono = telefono;

  String? _banco;
  String? get banco => _$this._banco;
  set banco(String? banco) => _$this._banco = banco;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PagosMovilesStructBuilder() {
    PagosMovilesStruct._initializeBuilder(this);
  }

  PagosMovilesStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nombre = $v.nombre;
      _telefono = $v.telefono;
      _banco = $v.banco;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PagosMovilesStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PagosMovilesStruct;
  }

  @override
  void update(void Function(PagosMovilesStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PagosMovilesStruct build() => _build();

  _$PagosMovilesStruct _build() {
    final _$result = _$v ??
        new _$PagosMovilesStruct._(
            nombre: nombre,
            telefono: telefono,
            banco: banco,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'PagosMovilesStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
