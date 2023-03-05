import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'pacientes_struct.g.dart';

abstract class PacientesStruct
    implements Built<PacientesStruct, PacientesStructBuilder> {
  static Serializer<PacientesStruct> get serializer =>
      _$pacientesStructSerializer;

  DocumentReference? get paciente;

  String? get metodoPago;

  String? get numeroReferencia;

  String? get comprobante;

  int? get status;

  int? get cedula;

  String? get motivoCita;

  String? get tipoTransferencia;

  String? get nombrePaciente;

  int? get numeroPaciente;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PacientesStructBuilder builder) => builder
    ..metodoPago = ''
    ..numeroReferencia = ''
    ..comprobante = ''
    ..status = 0
    ..cedula = 0
    ..motivoCita = ''
    ..tipoTransferencia = ''
    ..nombrePaciente = ''
    ..numeroPaciente = 0
    ..firestoreUtilData = FirestoreUtilData();

  PacientesStruct._();
  factory PacientesStruct([void Function(PacientesStructBuilder) updates]) =
      _$PacientesStruct;
}

PacientesStruct createPacientesStruct({
  DocumentReference? paciente,
  String? metodoPago,
  String? numeroReferencia,
  String? comprobante,
  int? status,
  int? cedula,
  String? motivoCita,
  String? tipoTransferencia,
  String? nombrePaciente,
  int? numeroPaciente,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PacientesStruct(
      (p) => p
        ..paciente = paciente
        ..metodoPago = metodoPago
        ..numeroReferencia = numeroReferencia
        ..comprobante = comprobante
        ..status = status
        ..cedula = cedula
        ..motivoCita = motivoCita
        ..tipoTransferencia = tipoTransferencia
        ..nombrePaciente = nombrePaciente
        ..numeroPaciente = numeroPaciente
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PacientesStruct? updatePacientesStruct(
  PacientesStruct? pacientes, {
  bool clearUnsetFields = true,
}) =>
    pacientes != null
        ? (pacientes.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPacientesStructData(
  Map<String, dynamic> firestoreData,
  PacientesStruct? pacientes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pacientes == null) {
    return;
  }
  if (pacientes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && pacientes.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pacientesData = getPacientesFirestoreData(pacientes, forFieldValue);
  final nestedData = pacientesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = pacientes.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPacientesFirestoreData(
  PacientesStruct? pacientes, [
  bool forFieldValue = false,
]) {
  if (pacientes == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PacientesStruct.serializer, pacientes);

  // Add any Firestore field values
  pacientes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPacientesListFirestoreData(
  List<PacientesStruct>? pacientess,
) =>
    pacientess?.map((p) => getPacientesFirestoreData(p, true)).toList() ?? [];
