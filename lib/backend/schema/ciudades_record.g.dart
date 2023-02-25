// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ciudades_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CiudadesRecord> _$ciudadesRecordSerializer =
    new _$CiudadesRecordSerializer();

class _$CiudadesRecordSerializer
    implements StructuredSerializer<CiudadesRecord> {
  @override
  final Iterable<Type> types = const [CiudadesRecord, _$CiudadesRecord];
  @override
  final String wireName = 'CiudadesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CiudadesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.ciudad;
    if (value != null) {
      result
        ..add('ciudad')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.usuarios;
    if (value != null) {
      result
        ..add('usuarios')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.medicos;
    if (value != null) {
      result
        ..add('medicos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  CiudadesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CiudadesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ciudad':
          result.ciudad = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'usuarios':
          result.usuarios.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'medicos':
          result.medicos.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$CiudadesRecord extends CiudadesRecord {
  @override
  final String? ciudad;
  @override
  final BuiltList<DocumentReference<Object?>>? usuarios;
  @override
  final BuiltList<DocumentReference<Object?>>? medicos;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CiudadesRecord([void Function(CiudadesRecordBuilder)? updates]) =>
      (new CiudadesRecordBuilder()..update(updates))._build();

  _$CiudadesRecord._({this.ciudad, this.usuarios, this.medicos, this.ffRef})
      : super._();

  @override
  CiudadesRecord rebuild(void Function(CiudadesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CiudadesRecordBuilder toBuilder() =>
      new CiudadesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CiudadesRecord &&
        ciudad == other.ciudad &&
        usuarios == other.usuarios &&
        medicos == other.medicos &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, ciudad.hashCode), usuarios.hashCode), medicos.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CiudadesRecord')
          ..add('ciudad', ciudad)
          ..add('usuarios', usuarios)
          ..add('medicos', medicos)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CiudadesRecordBuilder
    implements Builder<CiudadesRecord, CiudadesRecordBuilder> {
  _$CiudadesRecord? _$v;

  String? _ciudad;
  String? get ciudad => _$this._ciudad;
  set ciudad(String? ciudad) => _$this._ciudad = ciudad;

  ListBuilder<DocumentReference<Object?>>? _usuarios;
  ListBuilder<DocumentReference<Object?>> get usuarios =>
      _$this._usuarios ??= new ListBuilder<DocumentReference<Object?>>();
  set usuarios(ListBuilder<DocumentReference<Object?>>? usuarios) =>
      _$this._usuarios = usuarios;

  ListBuilder<DocumentReference<Object?>>? _medicos;
  ListBuilder<DocumentReference<Object?>> get medicos =>
      _$this._medicos ??= new ListBuilder<DocumentReference<Object?>>();
  set medicos(ListBuilder<DocumentReference<Object?>>? medicos) =>
      _$this._medicos = medicos;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CiudadesRecordBuilder() {
    CiudadesRecord._initializeBuilder(this);
  }

  CiudadesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _ciudad = $v.ciudad;
      _usuarios = $v.usuarios?.toBuilder();
      _medicos = $v.medicos?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CiudadesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CiudadesRecord;
  }

  @override
  void update(void Function(CiudadesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CiudadesRecord build() => _build();

  _$CiudadesRecord _build() {
    _$CiudadesRecord _$result;
    try {
      _$result = _$v ??
          new _$CiudadesRecord._(
              ciudad: ciudad,
              usuarios: _usuarios?.build(),
              medicos: _medicos?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usuarios';
        _usuarios?.build();
        _$failedField = 'medicos';
        _medicos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CiudadesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
