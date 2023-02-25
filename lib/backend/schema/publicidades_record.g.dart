// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publicidades_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PublicidadesRecord> _$publicidadesRecordSerializer =
    new _$PublicidadesRecordSerializer();

class _$PublicidadesRecordSerializer
    implements StructuredSerializer<PublicidadesRecord> {
  @override
  final Iterable<Type> types = const [PublicidadesRecord, _$PublicidadesRecord];
  @override
  final String wireName = 'PublicidadesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PublicidadesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'infoPublicidad',
      serializers.serialize(object.infoPublicidad,
          specifiedType: const FullType(InfoPublicidadStruct)),
    ];
    Object? value;
    value = object.titulo;
    if (value != null) {
      result
        ..add('titulo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.descripcion;
    if (value != null) {
      result
        ..add('descripcion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.precio;
    if (value != null) {
      result
        ..add('precio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.fechaActivacion;
    if (value != null) {
      result
        ..add('fechaActivacion')
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
  PublicidadesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PublicidadesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'titulo':
          result.titulo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'descripcion':
          result.descripcion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'precio':
          result.precio = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'infoPublicidad':
          result.infoPublicidad.replace(serializers.deserialize(value,
                  specifiedType: const FullType(InfoPublicidadStruct))!
              as InfoPublicidadStruct);
          break;
        case 'fechaActivacion':
          result.fechaActivacion = serializers.deserialize(value,
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

class _$PublicidadesRecord extends PublicidadesRecord {
  @override
  final String? titulo;
  @override
  final String? link;
  @override
  final String? descripcion;
  @override
  final String? img;
  @override
  final double? precio;
  @override
  final bool? status;
  @override
  final InfoPublicidadStruct infoPublicidad;
  @override
  final DateTime? fechaActivacion;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PublicidadesRecord(
          [void Function(PublicidadesRecordBuilder)? updates]) =>
      (new PublicidadesRecordBuilder()..update(updates))._build();

  _$PublicidadesRecord._(
      {this.titulo,
      this.link,
      this.descripcion,
      this.img,
      this.precio,
      this.status,
      required this.infoPublicidad,
      this.fechaActivacion,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        infoPublicidad, r'PublicidadesRecord', 'infoPublicidad');
  }

  @override
  PublicidadesRecord rebuild(
          void Function(PublicidadesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PublicidadesRecordBuilder toBuilder() =>
      new PublicidadesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PublicidadesRecord &&
        titulo == other.titulo &&
        link == other.link &&
        descripcion == other.descripcion &&
        img == other.img &&
        precio == other.precio &&
        status == other.status &&
        infoPublicidad == other.infoPublicidad &&
        fechaActivacion == other.fechaActivacion &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, titulo.hashCode), link.hashCode),
                                descripcion.hashCode),
                            img.hashCode),
                        precio.hashCode),
                    status.hashCode),
                infoPublicidad.hashCode),
            fechaActivacion.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PublicidadesRecord')
          ..add('titulo', titulo)
          ..add('link', link)
          ..add('descripcion', descripcion)
          ..add('img', img)
          ..add('precio', precio)
          ..add('status', status)
          ..add('infoPublicidad', infoPublicidad)
          ..add('fechaActivacion', fechaActivacion)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PublicidadesRecordBuilder
    implements Builder<PublicidadesRecord, PublicidadesRecordBuilder> {
  _$PublicidadesRecord? _$v;

  String? _titulo;
  String? get titulo => _$this._titulo;
  set titulo(String? titulo) => _$this._titulo = titulo;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _descripcion;
  String? get descripcion => _$this._descripcion;
  set descripcion(String? descripcion) => _$this._descripcion = descripcion;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  double? _precio;
  double? get precio => _$this._precio;
  set precio(double? precio) => _$this._precio = precio;

  bool? _status;
  bool? get status => _$this._status;
  set status(bool? status) => _$this._status = status;

  InfoPublicidadStructBuilder? _infoPublicidad;
  InfoPublicidadStructBuilder get infoPublicidad =>
      _$this._infoPublicidad ??= new InfoPublicidadStructBuilder();
  set infoPublicidad(InfoPublicidadStructBuilder? infoPublicidad) =>
      _$this._infoPublicidad = infoPublicidad;

  DateTime? _fechaActivacion;
  DateTime? get fechaActivacion => _$this._fechaActivacion;
  set fechaActivacion(DateTime? fechaActivacion) =>
      _$this._fechaActivacion = fechaActivacion;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PublicidadesRecordBuilder() {
    PublicidadesRecord._initializeBuilder(this);
  }

  PublicidadesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _titulo = $v.titulo;
      _link = $v.link;
      _descripcion = $v.descripcion;
      _img = $v.img;
      _precio = $v.precio;
      _status = $v.status;
      _infoPublicidad = $v.infoPublicidad.toBuilder();
      _fechaActivacion = $v.fechaActivacion;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PublicidadesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PublicidadesRecord;
  }

  @override
  void update(void Function(PublicidadesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PublicidadesRecord build() => _build();

  _$PublicidadesRecord _build() {
    _$PublicidadesRecord _$result;
    try {
      _$result = _$v ??
          new _$PublicidadesRecord._(
              titulo: titulo,
              link: link,
              descripcion: descripcion,
              img: img,
              precio: precio,
              status: status,
              infoPublicidad: infoPublicidad.build(),
              fechaActivacion: fechaActivacion,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'infoPublicidad';
        infoPublicidad.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PublicidadesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
