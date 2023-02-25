// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_publicidad_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InfoPublicidadStruct> _$infoPublicidadStructSerializer =
    new _$InfoPublicidadStructSerializer();

class _$InfoPublicidadStructSerializer
    implements StructuredSerializer<InfoPublicidadStruct> {
  @override
  final Iterable<Type> types = const [
    InfoPublicidadStruct,
    _$InfoPublicidadStruct
  ];
  @override
  final String wireName = 'InfoPublicidadStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, InfoPublicidadStruct object,
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
    value = object.correo;
    if (value != null) {
      result
        ..add('correo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  InfoPublicidadStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InfoPublicidadStructBuilder();

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
        case 'correo':
          result.correo = serializers.deserialize(value,
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

class _$InfoPublicidadStruct extends InfoPublicidadStruct {
  @override
  final String? nombre;
  @override
  final String? telefono;
  @override
  final String? correo;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$InfoPublicidadStruct(
          [void Function(InfoPublicidadStructBuilder)? updates]) =>
      (new InfoPublicidadStructBuilder()..update(updates))._build();

  _$InfoPublicidadStruct._(
      {this.nombre,
      this.telefono,
      this.correo,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'InfoPublicidadStruct', 'firestoreUtilData');
  }

  @override
  InfoPublicidadStruct rebuild(
          void Function(InfoPublicidadStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InfoPublicidadStructBuilder toBuilder() =>
      new InfoPublicidadStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InfoPublicidadStruct &&
        nombre == other.nombre &&
        telefono == other.telefono &&
        correo == other.correo &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, nombre.hashCode), telefono.hashCode), correo.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InfoPublicidadStruct')
          ..add('nombre', nombre)
          ..add('telefono', telefono)
          ..add('correo', correo)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class InfoPublicidadStructBuilder
    implements Builder<InfoPublicidadStruct, InfoPublicidadStructBuilder> {
  _$InfoPublicidadStruct? _$v;

  String? _nombre;
  String? get nombre => _$this._nombre;
  set nombre(String? nombre) => _$this._nombre = nombre;

  String? _telefono;
  String? get telefono => _$this._telefono;
  set telefono(String? telefono) => _$this._telefono = telefono;

  String? _correo;
  String? get correo => _$this._correo;
  set correo(String? correo) => _$this._correo = correo;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  InfoPublicidadStructBuilder() {
    InfoPublicidadStruct._initializeBuilder(this);
  }

  InfoPublicidadStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nombre = $v.nombre;
      _telefono = $v.telefono;
      _correo = $v.correo;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InfoPublicidadStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InfoPublicidadStruct;
  }

  @override
  void update(void Function(InfoPublicidadStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InfoPublicidadStruct build() => _build();

  _$InfoPublicidadStruct _build() {
    final _$result = _$v ??
        new _$InfoPublicidadStruct._(
            nombre: nombre,
            telefono: telefono,
            correo: correo,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'InfoPublicidadStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
