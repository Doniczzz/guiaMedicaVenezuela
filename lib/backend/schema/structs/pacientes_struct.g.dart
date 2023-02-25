// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pacientes_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PacientesStruct> _$pacientesStructSerializer =
    new _$PacientesStructSerializer();

class _$PacientesStructSerializer
    implements StructuredSerializer<PacientesStruct> {
  @override
  final Iterable<Type> types = const [PacientesStruct, _$PacientesStruct];
  @override
  final String wireName = 'PacientesStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PacientesStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.paciente;
    if (value != null) {
      result
        ..add('paciente')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.metodoPago;
    if (value != null) {
      result
        ..add('metodoPago')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.numeroReferencia;
    if (value != null) {
      result
        ..add('numeroReferencia')
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cedula;
    if (value != null) {
      result
        ..add('cedula')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.motivoCita;
    if (value != null) {
      result
        ..add('motivoCita')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tipoTransferencia;
    if (value != null) {
      result
        ..add('tipoTransferencia')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nombrePaciente;
    if (value != null) {
      result
        ..add('nombrePaciente')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PacientesStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PacientesStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'paciente':
          result.paciente = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'metodoPago':
          result.metodoPago = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'numeroReferencia':
          result.numeroReferencia = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comprobante':
          result.comprobante = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cedula':
          result.cedula = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'motivoCita':
          result.motivoCita = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tipoTransferencia':
          result.tipoTransferencia = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nombrePaciente':
          result.nombrePaciente = serializers.deserialize(value,
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

class _$PacientesStruct extends PacientesStruct {
  @override
  final DocumentReference<Object?>? paciente;
  @override
  final String? metodoPago;
  @override
  final String? numeroReferencia;
  @override
  final String? comprobante;
  @override
  final int? status;
  @override
  final int? cedula;
  @override
  final String? motivoCita;
  @override
  final String? tipoTransferencia;
  @override
  final String? nombrePaciente;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PacientesStruct([void Function(PacientesStructBuilder)? updates]) =>
      (new PacientesStructBuilder()..update(updates))._build();

  _$PacientesStruct._(
      {this.paciente,
      this.metodoPago,
      this.numeroReferencia,
      this.comprobante,
      this.status,
      this.cedula,
      this.motivoCita,
      this.tipoTransferencia,
      this.nombrePaciente,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PacientesStruct', 'firestoreUtilData');
  }

  @override
  PacientesStruct rebuild(void Function(PacientesStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PacientesStructBuilder toBuilder() =>
      new PacientesStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PacientesStruct &&
        paciente == other.paciente &&
        metodoPago == other.metodoPago &&
        numeroReferencia == other.numeroReferencia &&
        comprobante == other.comprobante &&
        status == other.status &&
        cedula == other.cedula &&
        motivoCita == other.motivoCita &&
        tipoTransferencia == other.tipoTransferencia &&
        nombrePaciente == other.nombrePaciente &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, paciente.hashCode),
                                        metodoPago.hashCode),
                                    numeroReferencia.hashCode),
                                comprobante.hashCode),
                            status.hashCode),
                        cedula.hashCode),
                    motivoCita.hashCode),
                tipoTransferencia.hashCode),
            nombrePaciente.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PacientesStruct')
          ..add('paciente', paciente)
          ..add('metodoPago', metodoPago)
          ..add('numeroReferencia', numeroReferencia)
          ..add('comprobante', comprobante)
          ..add('status', status)
          ..add('cedula', cedula)
          ..add('motivoCita', motivoCita)
          ..add('tipoTransferencia', tipoTransferencia)
          ..add('nombrePaciente', nombrePaciente)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PacientesStructBuilder
    implements Builder<PacientesStruct, PacientesStructBuilder> {
  _$PacientesStruct? _$v;

  DocumentReference<Object?>? _paciente;
  DocumentReference<Object?>? get paciente => _$this._paciente;
  set paciente(DocumentReference<Object?>? paciente) =>
      _$this._paciente = paciente;

  String? _metodoPago;
  String? get metodoPago => _$this._metodoPago;
  set metodoPago(String? metodoPago) => _$this._metodoPago = metodoPago;

  String? _numeroReferencia;
  String? get numeroReferencia => _$this._numeroReferencia;
  set numeroReferencia(String? numeroReferencia) =>
      _$this._numeroReferencia = numeroReferencia;

  String? _comprobante;
  String? get comprobante => _$this._comprobante;
  set comprobante(String? comprobante) => _$this._comprobante = comprobante;

  int? _status;
  int? get status => _$this._status;
  set status(int? status) => _$this._status = status;

  int? _cedula;
  int? get cedula => _$this._cedula;
  set cedula(int? cedula) => _$this._cedula = cedula;

  String? _motivoCita;
  String? get motivoCita => _$this._motivoCita;
  set motivoCita(String? motivoCita) => _$this._motivoCita = motivoCita;

  String? _tipoTransferencia;
  String? get tipoTransferencia => _$this._tipoTransferencia;
  set tipoTransferencia(String? tipoTransferencia) =>
      _$this._tipoTransferencia = tipoTransferencia;

  String? _nombrePaciente;
  String? get nombrePaciente => _$this._nombrePaciente;
  set nombrePaciente(String? nombrePaciente) =>
      _$this._nombrePaciente = nombrePaciente;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PacientesStructBuilder() {
    PacientesStruct._initializeBuilder(this);
  }

  PacientesStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paciente = $v.paciente;
      _metodoPago = $v.metodoPago;
      _numeroReferencia = $v.numeroReferencia;
      _comprobante = $v.comprobante;
      _status = $v.status;
      _cedula = $v.cedula;
      _motivoCita = $v.motivoCita;
      _tipoTransferencia = $v.tipoTransferencia;
      _nombrePaciente = $v.nombrePaciente;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PacientesStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PacientesStruct;
  }

  @override
  void update(void Function(PacientesStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PacientesStruct build() => _build();

  _$PacientesStruct _build() {
    final _$result = _$v ??
        new _$PacientesStruct._(
            paciente: paciente,
            metodoPago: metodoPago,
            numeroReferencia: numeroReferencia,
            comprobante: comprobante,
            status: status,
            cedula: cedula,
            motivoCita: motivoCita,
            tipoTransferencia: tipoTransferencia,
            nombrePaciente: nombrePaciente,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'PacientesStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
