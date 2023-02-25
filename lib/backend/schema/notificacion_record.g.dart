// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacion_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificacionRecord> _$notificacionRecordSerializer =
    new _$NotificacionRecordSerializer();

class _$NotificacionRecordSerializer
    implements StructuredSerializer<NotificacionRecord> {
  @override
  final Iterable<Type> types = const [NotificacionRecord, _$NotificacionRecord];
  @override
  final String wireName = 'NotificacionRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificacionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.de;
    if (value != null) {
      result
        ..add('de')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.para;
    if (value != null) {
      result
        ..add('para')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.mensaje;
    if (value != null) {
      result
        ..add('mensaje')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fecha;
    if (value != null) {
      result
        ..add('fecha')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  NotificacionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificacionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'de':
          result.de = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'para':
          result.para = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'mensaje':
          result.mensaje = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fecha':
          result.fecha = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$NotificacionRecord extends NotificacionRecord {
  @override
  final DocumentReference<Object?>? de;
  @override
  final DocumentReference<Object?>? para;
  @override
  final String? mensaje;
  @override
  final DateTime? fecha;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotificacionRecord(
          [void Function(NotificacionRecordBuilder)? updates]) =>
      (new NotificacionRecordBuilder()..update(updates))._build();

  _$NotificacionRecord._(
      {this.de, this.para, this.mensaje, this.fecha, this.ffRef})
      : super._();

  @override
  NotificacionRecord rebuild(
          void Function(NotificacionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificacionRecordBuilder toBuilder() =>
      new NotificacionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificacionRecord &&
        de == other.de &&
        para == other.para &&
        mensaje == other.mensaje &&
        fecha == other.fecha &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, de.hashCode), para.hashCode), mensaje.hashCode),
            fecha.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificacionRecord')
          ..add('de', de)
          ..add('para', para)
          ..add('mensaje', mensaje)
          ..add('fecha', fecha)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotificacionRecordBuilder
    implements Builder<NotificacionRecord, NotificacionRecordBuilder> {
  _$NotificacionRecord? _$v;

  DocumentReference<Object?>? _de;
  DocumentReference<Object?>? get de => _$this._de;
  set de(DocumentReference<Object?>? de) => _$this._de = de;

  DocumentReference<Object?>? _para;
  DocumentReference<Object?>? get para => _$this._para;
  set para(DocumentReference<Object?>? para) => _$this._para = para;

  String? _mensaje;
  String? get mensaje => _$this._mensaje;
  set mensaje(String? mensaje) => _$this._mensaje = mensaje;

  DateTime? _fecha;
  DateTime? get fecha => _$this._fecha;
  set fecha(DateTime? fecha) => _$this._fecha = fecha;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotificacionRecordBuilder() {
    NotificacionRecord._initializeBuilder(this);
  }

  NotificacionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _de = $v.de;
      _para = $v.para;
      _mensaje = $v.mensaje;
      _fecha = $v.fecha;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificacionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificacionRecord;
  }

  @override
  void update(void Function(NotificacionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificacionRecord build() => _build();

  _$NotificacionRecord _build() {
    final _$result = _$v ??
        new _$NotificacionRecord._(
            de: de, para: para, mensaje: mensaje, fecha: fecha, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
