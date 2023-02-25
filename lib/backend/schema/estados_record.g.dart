// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estados_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EstadosRecord> _$estadosRecordSerializer =
    new _$EstadosRecordSerializer();

class _$EstadosRecordSerializer implements StructuredSerializer<EstadosRecord> {
  @override
  final Iterable<Type> types = const [EstadosRecord, _$EstadosRecord];
  @override
  final String wireName = 'EstadosRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, EstadosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.estado;
    if (value != null) {
      result
        ..add('estado')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  EstadosRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EstadosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'estado':
          result.estado = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$EstadosRecord extends EstadosRecord {
  @override
  final String? estado;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$EstadosRecord([void Function(EstadosRecordBuilder)? updates]) =>
      (new EstadosRecordBuilder()..update(updates))._build();

  _$EstadosRecord._({this.estado, this.ffRef}) : super._();

  @override
  EstadosRecord rebuild(void Function(EstadosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EstadosRecordBuilder toBuilder() => new EstadosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EstadosRecord &&
        estado == other.estado &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, estado.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EstadosRecord')
          ..add('estado', estado)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class EstadosRecordBuilder
    implements Builder<EstadosRecord, EstadosRecordBuilder> {
  _$EstadosRecord? _$v;

  String? _estado;
  String? get estado => _$this._estado;
  set estado(String? estado) => _$this._estado = estado;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  EstadosRecordBuilder() {
    EstadosRecord._initializeBuilder(this);
  }

  EstadosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _estado = $v.estado;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EstadosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EstadosRecord;
  }

  @override
  void update(void Function(EstadosRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EstadosRecord build() => _build();

  _$EstadosRecord _build() {
    final _$result = _$v ?? new _$EstadosRecord._(estado: estado, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
