import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'datos_personales_struct.g.dart';

abstract class DatosPersonalesStruct
    implements Built<DatosPersonalesStruct, DatosPersonalesStructBuilder> {
  static Serializer<DatosPersonalesStruct> get serializer =>
      _$datosPersonalesStructSerializer;

  String? get telefono;

  String? get cedula;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DatosPersonalesStructBuilder builder) =>
      builder
        ..telefono = ''
        ..cedula = ''
        ..firestoreUtilData = FirestoreUtilData();

  DatosPersonalesStruct._();
  factory DatosPersonalesStruct(
          [void Function(DatosPersonalesStructBuilder) updates]) =
      _$DatosPersonalesStruct;
}

DatosPersonalesStruct createDatosPersonalesStruct({
  String? telefono,
  String? cedula,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DatosPersonalesStruct(
      (d) => d
        ..telefono = telefono
        ..cedula = cedula
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DatosPersonalesStruct? updateDatosPersonalesStruct(
  DatosPersonalesStruct? datosPersonales, {
  bool clearUnsetFields = true,
}) =>
    datosPersonales != null
        ? (datosPersonales.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDatosPersonalesStructData(
  Map<String, dynamic> firestoreData,
  DatosPersonalesStruct? datosPersonales,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (datosPersonales == null) {
    return;
  }
  if (datosPersonales.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && datosPersonales.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final datosPersonalesData =
      getDatosPersonalesFirestoreData(datosPersonales, forFieldValue);
  final nestedData =
      datosPersonalesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = datosPersonales.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDatosPersonalesFirestoreData(
  DatosPersonalesStruct? datosPersonales, [
  bool forFieldValue = false,
]) {
  if (datosPersonales == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      DatosPersonalesStruct.serializer, datosPersonales);

  // Add any Firestore field values
  datosPersonales.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDatosPersonalesListFirestoreData(
  List<DatosPersonalesStruct>? datosPersonaless,
) =>
    datosPersonaless
        ?.map((d) => getDatosPersonalesFirestoreData(d, true))
        .toList() ??
    [];
