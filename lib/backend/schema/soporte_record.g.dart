// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soporte_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SoporteRecord> _$soporteRecordSerializer =
    new _$SoporteRecordSerializer();

class _$SoporteRecordSerializer implements StructuredSerializer<SoporteRecord> {
  @override
  final Iterable<Type> types = const [SoporteRecord, _$SoporteRecord];
  @override
  final String wireName = 'SoporteRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, SoporteRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.texto;
    if (value != null) {
      result
        ..add('texto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.usuario;
    if (value != null) {
      result
        ..add('usuario')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  SoporteRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SoporteRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'texto':
          result.texto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'usuario':
          result.usuario = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$SoporteRecord extends SoporteRecord {
  @override
  final String? texto;
  @override
  final DocumentReference<Object?>? usuario;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SoporteRecord([void Function(SoporteRecordBuilder)? updates]) =>
      (new SoporteRecordBuilder()..update(updates))._build();

  _$SoporteRecord._({this.texto, this.usuario, this.ffRef}) : super._();

  @override
  SoporteRecord rebuild(void Function(SoporteRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SoporteRecordBuilder toBuilder() => new SoporteRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SoporteRecord &&
        texto == other.texto &&
        usuario == other.usuario &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, texto.hashCode), usuario.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SoporteRecord')
          ..add('texto', texto)
          ..add('usuario', usuario)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SoporteRecordBuilder
    implements Builder<SoporteRecord, SoporteRecordBuilder> {
  _$SoporteRecord? _$v;

  String? _texto;
  String? get texto => _$this._texto;
  set texto(String? texto) => _$this._texto = texto;

  DocumentReference<Object?>? _usuario;
  DocumentReference<Object?>? get usuario => _$this._usuario;
  set usuario(DocumentReference<Object?>? usuario) => _$this._usuario = usuario;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SoporteRecordBuilder() {
    SoporteRecord._initializeBuilder(this);
  }

  SoporteRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _texto = $v.texto;
      _usuario = $v.usuario;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SoporteRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SoporteRecord;
  }

  @override
  void update(void Function(SoporteRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SoporteRecord build() => _build();

  _$SoporteRecord _build() {
    final _$result = _$v ??
        new _$SoporteRecord._(texto: texto, usuario: usuario, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
