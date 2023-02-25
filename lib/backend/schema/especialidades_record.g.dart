// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'especialidades_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EspecialidadesRecord> _$especialidadesRecordSerializer =
    new _$EspecialidadesRecordSerializer();

class _$EspecialidadesRecordSerializer
    implements StructuredSerializer<EspecialidadesRecord> {
  @override
  final Iterable<Type> types = const [
    EspecialidadesRecord,
    _$EspecialidadesRecord
  ];
  @override
  final String wireName = 'EspecialidadesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, EspecialidadesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.especialidad;
    if (value != null) {
      result
        ..add('especialidad')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  EspecialidadesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EspecialidadesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'especialidad':
          result.especialidad = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$EspecialidadesRecord extends EspecialidadesRecord {
  @override
  final String? especialidad;
  @override
  final BuiltList<DocumentReference<Object?>>? medicos;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EspecialidadesRecord(
          [void Function(EspecialidadesRecordBuilder)? updates]) =>
      (new EspecialidadesRecordBuilder()..update(updates))._build();

  _$EspecialidadesRecord._({this.especialidad, this.medicos, this.ffRef})
      : super._();

  @override
  EspecialidadesRecord rebuild(
          void Function(EspecialidadesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EspecialidadesRecordBuilder toBuilder() =>
      new EspecialidadesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EspecialidadesRecord &&
        especialidad == other.especialidad &&
        medicos == other.medicos &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, especialidad.hashCode), medicos.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EspecialidadesRecord')
          ..add('especialidad', especialidad)
          ..add('medicos', medicos)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EspecialidadesRecordBuilder
    implements Builder<EspecialidadesRecord, EspecialidadesRecordBuilder> {
  _$EspecialidadesRecord? _$v;

  String? _especialidad;
  String? get especialidad => _$this._especialidad;
  set especialidad(String? especialidad) => _$this._especialidad = especialidad;

  ListBuilder<DocumentReference<Object?>>? _medicos;
  ListBuilder<DocumentReference<Object?>> get medicos =>
      _$this._medicos ??= new ListBuilder<DocumentReference<Object?>>();
  set medicos(ListBuilder<DocumentReference<Object?>>? medicos) =>
      _$this._medicos = medicos;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EspecialidadesRecordBuilder() {
    EspecialidadesRecord._initializeBuilder(this);
  }

  EspecialidadesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _especialidad = $v.especialidad;
      _medicos = $v.medicos?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EspecialidadesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EspecialidadesRecord;
  }

  @override
  void update(void Function(EspecialidadesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EspecialidadesRecord build() => _build();

  _$EspecialidadesRecord _build() {
    _$EspecialidadesRecord _$result;
    try {
      _$result = _$v ??
          new _$EspecialidadesRecord._(
              especialidad: especialidad,
              medicos: _medicos?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medicos';
        _medicos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'EspecialidadesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
