import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'datos_pacientes_struct.g.dart';

abstract class DatosPacientesStruct
    implements Built<DatosPacientesStruct, DatosPacientesStructBuilder> {
  static Serializer<DatosPacientesStruct> get serializer =>
      _$datosPacientesStructSerializer;

  String? get nombre;

  String? get cedula;

  String? get metodoPago;

  String? get comprobante;

  String? get motivoVisita;

  String? get especialidad;

  String? get status;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DatosPacientesStructBuilder builder) => builder
    ..nombre = ''
    ..cedula = ''
    ..metodoPago = ''
    ..comprobante = ''
    ..motivoVisita = ''
    ..especialidad = ''
    ..status = ''
    ..firestoreUtilData = FirestoreUtilData();

  DatosPacientesStruct._();
  factory DatosPacientesStruct(
          [void Function(DatosPacientesStructBuilder) updates]) =
      _$DatosPacientesStruct;
}

DatosPacientesStruct createDatosPacientesStruct({
  String? nombre,
  String? cedula,
  String? metodoPago,
  String? comprobante,
  String? motivoVisita,
  String? especialidad,
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DatosPacientesStruct(
      (d) => d
        ..nombre = nombre
        ..cedula = cedula
        ..metodoPago = metodoPago
        ..comprobante = comprobante
        ..motivoVisita = motivoVisita
        ..especialidad = especialidad
        ..status = status
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DatosPacientesStruct? updateDatosPacientesStruct(
  DatosPacientesStruct? datosPacientes, {
  bool clearUnsetFields = true,
}) =>
    datosPacientes != null
        ? (datosPacientes.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDatosPacientesStructData(
  Map<String, dynamic> firestoreData,
  DatosPacientesStruct? datosPacientes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (datosPacientes == null) {
    return;
  }
  if (datosPacientes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && datosPacientes.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final datosPacientesData =
      getDatosPacientesFirestoreData(datosPacientes, forFieldValue);
  final nestedData =
      datosPacientesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = datosPacientes.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDatosPacientesFirestoreData(
  DatosPacientesStruct? datosPacientes, [
  bool forFieldValue = false,
]) {
  if (datosPacientes == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(DatosPacientesStruct.serializer, datosPacientes);

  // Add any Firestore field values
  datosPacientes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDatosPacientesListFirestoreData(
  List<DatosPacientesStruct>? datosPacientess,
) =>
    datosPacientess
        ?.map((d) => getDatosPacientesFirestoreData(d, true))
        .toList() ??
    [];
