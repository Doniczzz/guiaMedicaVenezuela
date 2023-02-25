// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datos_pacientes_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DatosPacientesStruct> _$datosPacientesStructSerializer =
    new _$DatosPacientesStructSerializer();

class _$DatosPacientesStructSerializer
    implements StructuredSerializer<DatosPacientesStruct> {
  @override
  final Iterable<Type> types = const [
    DatosPacientesStruct,
    _$DatosPacientesStruct
  ];
  @override
  final String wireName = 'DatosPacientesStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DatosPacientesStruct object,
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
    value = object.cedula;
    if (value != null) {
      result
        ..add('cedula')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.metodoPago;
    if (value != null) {
      result
        ..add('metodoPago')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comprobante;
    if (value != null) {
      result
        ..add('comprobante')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.motivoVisita;
    if (value != null) {
      result
        ..add('motivoVisita')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.especialidad;
    if (value != null) {
      result
        ..add('especialidad')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DatosPacientesStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DatosPacientesStructBuilder();

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
        case 'cedula':
          result.cedula = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'metodoPago':
          result.metodoPago = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comprobante':
          result.comprobante = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'motivoVisita':
          result.motivoVisita = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'especialidad':
          result.especialidad = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
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

class _$DatosPacientesStruct extends DatosPacientesStruct {
  @override
  final String? nombre;
  @override
  final String? cedula;
  @override
  final String? metodoPago;
  @override
  final String? comprobante;
  @override
  final String? motivoVisita;
  @override
  final String? especialidad;
  @override
  final String? status;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DatosPacientesStruct(
          [void Function(DatosPacientesStructBuilder)? updates]) =>
      (new DatosPacientesStructBuilder()..update(updates))._build();

  _$DatosPacientesStruct._(
      {this.nombre,
      this.cedula,
      this.metodoPago,
      this.comprobante,
      this.motivoVisita,
      this.especialidad,
      this.status,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DatosPacientesStruct', 'firestoreUtilData');
  }

  @override
  DatosPacientesStruct rebuild(
          void Function(DatosPacientesStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DatosPacientesStructBuilder toBuilder() =>
      new DatosPacientesStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DatosPacientesStruct &&
        nombre == other.nombre &&
        cedula == other.cedula &&
        metodoPago == other.metodoPago &&
        comprobante == other.comprobante &&
        motivoVisita == other.motivoVisita &&
        especialidad == other.especialidad &&
        status == other.status &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, nombre.hashCode), cedula.hashCode),
                            metodoPago.hashCode),
                        comprobante.hashCode),
                    motivoVisita.hashCode),
                especialidad.hashCode),
            status.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DatosPacientesStruct')
          ..add('nombre', nombre)
          ..add('cedula', cedula)
          ..add('metodoPago', metodoPago)
          ..add('comprobante', comprobante)
          ..add('motivoVisita', motivoVisita)
          ..add('especialidad', especialidad)
          ..add('status', status)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DatosPacientesStructBuilder
    implements Builder<DatosPacientesStruct, DatosPacientesStructBuilder> {
  _$DatosPacientesStruct? _$v;

  String? _nombre;
  String? get nombre => _$this._nombre;
  set nombre(String? nombre) => _$this._nombre = nombre;

  String? _cedula;
  String? get cedula => _$this._cedula;
  set cedula(String? cedula) => _$this._cedula = cedula;

  String? _metodoPago;
  String? get metodoPago => _$this._metodoPago;
  set metodoPago(String? metodoPago) => _$this._metodoPago = metodoPago;

  String? _comprobante;
  String? get comprobante => _$this._comprobante;
  set comprobante(String? comprobante) => _$this._comprobante = comprobante;

  String? _motivoVisita;
  String? get motivoVisita => _$this._motivoVisita;
  set motivoVisita(String? motivoVisita) => _$this._motivoVisita = motivoVisita;

  String? _especialidad;
  String? get especialidad => _$this._especialidad;
  set especialidad(String? especialidad) => _$this._especialidad = especialidad;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DatosPacientesStructBuilder() {
    DatosPacientesStruct._initializeBuilder(this);
  }

  DatosPacientesStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nombre = $v.nombre;
      _cedula = $v.cedula;
      _metodoPago = $v.metodoPago;
      _comprobante = $v.comprobante;
      _motivoVisita = $v.motivoVisita;
      _especialidad = $v.especialidad;
      _status = $v.status;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DatosPacientesStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DatosPacientesStruct;
  }

  @override
  void update(void Function(DatosPacientesStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DatosPacientesStruct build() => _build();

  _$DatosPacientesStruct _build() {
    final _$result = _$v ??
        new _$DatosPacientesStruct._(
            nombre: nombre,
            cedula: cedula,
            metodoPago: metodoPago,
            comprobante: comprobante,
            motivoVisita: motivoVisita,
            especialidad: especialidad,
            status: status,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'DatosPacientesStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
