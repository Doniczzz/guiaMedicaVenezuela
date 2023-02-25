// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donde_vive_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DondeViveStruct> _$dondeViveStructSerializer =
    new _$DondeViveStructSerializer();

class _$DondeViveStructSerializer
    implements StructuredSerializer<DondeViveStruct> {
  @override
  final Iterable<Type> types = const [DondeViveStruct, _$DondeViveStruct];
  @override
  final String wireName = 'DondeViveStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, DondeViveStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.estado;
    if (value != null) {
      result
        ..add('estado')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ciudad;
    if (value != null) {
      result
        ..add('ciudad')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  DondeViveStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DondeViveStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'estado':
          result.estado = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'ciudad':
          result.ciudad = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$DondeViveStruct extends DondeViveStruct {
  @override
  final DocumentReference<Object?>? estado;
  @override
  final DocumentReference<Object?>? ciudad;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DondeViveStruct([void Function(DondeViveStructBuilder)? updates]) =>
      (new DondeViveStructBuilder()..update(updates))._build();

  _$DondeViveStruct._(
      {this.estado, this.ciudad, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DondeViveStruct', 'firestoreUtilData');
  }

  @override
  DondeViveStruct rebuild(void Function(DondeViveStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DondeViveStructBuilder toBuilder() =>
      new DondeViveStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DondeViveStruct &&
        estado == other.estado &&
        ciudad == other.ciudad &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, estado.hashCode), ciudad.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DondeViveStruct')
          ..add('estado', estado)
          ..add('ciudad', ciudad)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DondeViveStructBuilder
    implements Builder<DondeViveStruct, DondeViveStructBuilder> {
  _$DondeViveStruct? _$v;

  DocumentReference<Object?>? _estado;
  DocumentReference<Object?>? get estado => _$this._estado;
  set estado(DocumentReference<Object?>? estado) => _$this._estado = estado;

  DocumentReference<Object?>? _ciudad;
  DocumentReference<Object?>? get ciudad => _$this._ciudad;
  set ciudad(DocumentReference<Object?>? ciudad) => _$this._ciudad = ciudad;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DondeViveStructBuilder() {
    DondeViveStruct._initializeBuilder(this);
  }

  DondeViveStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _estado = $v.estado;
      _ciudad = $v.ciudad;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DondeViveStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DondeViveStruct;
  }

  @override
  void update(void Function(DondeViveStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DondeViveStruct build() => _build();

  _$DondeViveStruct _build() {
    final _$result = _$v ??
        new _$DondeViveStruct._(
            estado: estado,
            ciudad: ciudad,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'DondeViveStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
