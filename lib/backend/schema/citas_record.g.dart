// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CitasRecord> _$citasRecordSerializer = new _$CitasRecordSerializer();

class _$CitasRecordSerializer implements StructuredSerializer<CitasRecord> {
  @override
  final Iterable<Type> types = const [CitasRecord, _$CitasRecord];
  @override
  final String wireName = 'CitasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CitasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.medico;
    if (value != null) {
      result
        ..add('medico')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.fecha;
    if (value != null) {
      result
        ..add('fecha')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.precio;
    if (value != null) {
      result
        ..add('precio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.maxCitas;
    if (value != null) {
      result
        ..add('maxCitas')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.especialidad;
    if (value != null) {
      result
        ..add('especialidad')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.moneda;
    if (value != null) {
      result
        ..add('moneda')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.moneda2;
    if (value != null) {
      result
        ..add('moneda2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aceptaEfectivo;
    if (value != null) {
      result
        ..add('aceptaEfectivo')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.tipoDeMoneda;
    if (value != null) {
      result
        ..add('tipoDeMoneda')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pacientes;
    if (value != null) {
      result
        ..add('pacientes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PacientesStruct)])));
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
  CitasRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CitasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'medico':
          result.medico = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'fecha':
          result.fecha = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'precio':
          result.precio = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'maxCitas':
          result.maxCitas = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'especialidad':
          result.especialidad = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'moneda':
          result.moneda = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'moneda2':
          result.moneda2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'aceptaEfectivo':
          result.aceptaEfectivo = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'tipoDeMoneda':
          result.tipoDeMoneda = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pacientes':
          result.pacientes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PacientesStruct)]))!
              as BuiltList<Object?>);
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

class _$CitasRecord extends CitasRecord {
  @override
  final DocumentReference<Object?>? medico;
  @override
  final DateTime? fecha;
  @override
  final double? precio;
  @override
  final int? maxCitas;
  @override
  final String? especialidad;
  @override
  final String? moneda;
  @override
  final String? moneda2;
  @override
  final bool? aceptaEfectivo;
  @override
  final String? tipoDeMoneda;
  @override
  final BuiltList<PacientesStruct>? pacientes;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CitasRecord([void Function(CitasRecordBuilder)? updates]) =>
      (new CitasRecordBuilder()..update(updates))._build();

  _$CitasRecord._(
      {this.medico,
      this.fecha,
      this.precio,
      this.maxCitas,
      this.especialidad,
      this.moneda,
      this.moneda2,
      this.aceptaEfectivo,
      this.tipoDeMoneda,
      this.pacientes,
      this.ffRef})
      : super._();

  @override
  CitasRecord rebuild(void Function(CitasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CitasRecordBuilder toBuilder() => new CitasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CitasRecord &&
        medico == other.medico &&
        fecha == other.fecha &&
        precio == other.precio &&
        maxCitas == other.maxCitas &&
        especialidad == other.especialidad &&
        moneda == other.moneda &&
        moneda2 == other.moneda2 &&
        aceptaEfectivo == other.aceptaEfectivo &&
        tipoDeMoneda == other.tipoDeMoneda &&
        pacientes == other.pacientes &&
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
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, medico.hashCode),
                                            fecha.hashCode),
                                        precio.hashCode),
                                    maxCitas.hashCode),
                                especialidad.hashCode),
                            moneda.hashCode),
                        moneda2.hashCode),
                    aceptaEfectivo.hashCode),
                tipoDeMoneda.hashCode),
            pacientes.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CitasRecord')
          ..add('medico', medico)
          ..add('fecha', fecha)
          ..add('precio', precio)
          ..add('maxCitas', maxCitas)
          ..add('especialidad', especialidad)
          ..add('moneda', moneda)
          ..add('moneda2', moneda2)
          ..add('aceptaEfectivo', aceptaEfectivo)
          ..add('tipoDeMoneda', tipoDeMoneda)
          ..add('pacientes', pacientes)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CitasRecordBuilder implements Builder<CitasRecord, CitasRecordBuilder> {
  _$CitasRecord? _$v;

  DocumentReference<Object?>? _medico;
  DocumentReference<Object?>? get medico => _$this._medico;
  set medico(DocumentReference<Object?>? medico) => _$this._medico = medico;

  DateTime? _fecha;
  DateTime? get fecha => _$this._fecha;
  set fecha(DateTime? fecha) => _$this._fecha = fecha;

  double? _precio;
  double? get precio => _$this._precio;
  set precio(double? precio) => _$this._precio = precio;

  int? _maxCitas;
  int? get maxCitas => _$this._maxCitas;
  set maxCitas(int? maxCitas) => _$this._maxCitas = maxCitas;

  String? _especialidad;
  String? get especialidad => _$this._especialidad;
  set especialidad(String? especialidad) => _$this._especialidad = especialidad;

  String? _moneda;
  String? get moneda => _$this._moneda;
  set moneda(String? moneda) => _$this._moneda = moneda;

  String? _moneda2;
  String? get moneda2 => _$this._moneda2;
  set moneda2(String? moneda2) => _$this._moneda2 = moneda2;

  bool? _aceptaEfectivo;
  bool? get aceptaEfectivo => _$this._aceptaEfectivo;
  set aceptaEfectivo(bool? aceptaEfectivo) =>
      _$this._aceptaEfectivo = aceptaEfectivo;

  String? _tipoDeMoneda;
  String? get tipoDeMoneda => _$this._tipoDeMoneda;
  set tipoDeMoneda(String? tipoDeMoneda) => _$this._tipoDeMoneda = tipoDeMoneda;

  ListBuilder<PacientesStruct>? _pacientes;
  ListBuilder<PacientesStruct> get pacientes =>
      _$this._pacientes ??= new ListBuilder<PacientesStruct>();
  set pacientes(ListBuilder<PacientesStruct>? pacientes) =>
      _$this._pacientes = pacientes;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CitasRecordBuilder() {
    CitasRecord._initializeBuilder(this);
  }

  CitasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _medico = $v.medico;
      _fecha = $v.fecha;
      _precio = $v.precio;
      _maxCitas = $v.maxCitas;
      _especialidad = $v.especialidad;
      _moneda = $v.moneda;
      _moneda2 = $v.moneda2;
      _aceptaEfectivo = $v.aceptaEfectivo;
      _tipoDeMoneda = $v.tipoDeMoneda;
      _pacientes = $v.pacientes?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CitasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CitasRecord;
  }

  @override
  void update(void Function(CitasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CitasRecord build() => _build();

  _$CitasRecord _build() {
    _$CitasRecord _$result;
    try {
      _$result = _$v ??
          new _$CitasRecord._(
              medico: medico,
              fecha: fecha,
              precio: precio,
              maxCitas: maxCitas,
              especialidad: especialidad,
              moneda: moneda,
              moneda2: moneda2,
              aceptaEfectivo: aceptaEfectivo,
              tipoDeMoneda: tipoDeMoneda,
              pacientes: _pacientes?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pacientes';
        _pacientes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CitasRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
