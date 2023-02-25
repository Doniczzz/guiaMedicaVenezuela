import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'info_publicidad_struct.g.dart';

abstract class InfoPublicidadStruct
    implements Built<InfoPublicidadStruct, InfoPublicidadStructBuilder> {
  static Serializer<InfoPublicidadStruct> get serializer =>
      _$infoPublicidadStructSerializer;

  String? get nombre;

  String? get telefono;

  String? get correo;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(InfoPublicidadStructBuilder builder) => builder
    ..nombre = ''
    ..telefono = ''
    ..correo = ''
    ..firestoreUtilData = FirestoreUtilData();

  InfoPublicidadStruct._();
  factory InfoPublicidadStruct(
          [void Function(InfoPublicidadStructBuilder) updates]) =
      _$InfoPublicidadStruct;
}

InfoPublicidadStruct createInfoPublicidadStruct({
  String? nombre,
  String? telefono,
  String? correo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InfoPublicidadStruct(
      (i) => i
        ..nombre = nombre
        ..telefono = telefono
        ..correo = correo
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

InfoPublicidadStruct? updateInfoPublicidadStruct(
  InfoPublicidadStruct? infoPublicidad, {
  bool clearUnsetFields = true,
}) =>
    infoPublicidad != null
        ? (infoPublicidad.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addInfoPublicidadStructData(
  Map<String, dynamic> firestoreData,
  InfoPublicidadStruct? infoPublicidad,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (infoPublicidad == null) {
    return;
  }
  if (infoPublicidad.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && infoPublicidad.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final infoPublicidadData =
      getInfoPublicidadFirestoreData(infoPublicidad, forFieldValue);
  final nestedData =
      infoPublicidadData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = infoPublicidad.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getInfoPublicidadFirestoreData(
  InfoPublicidadStruct? infoPublicidad, [
  bool forFieldValue = false,
]) {
  if (infoPublicidad == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(InfoPublicidadStruct.serializer, infoPublicidad);

  // Add any Firestore field values
  infoPublicidad.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInfoPublicidadListFirestoreData(
  List<InfoPublicidadStruct>? infoPublicidads,
) =>
    infoPublicidads
        ?.map((i) => getInfoPublicidadFirestoreData(i, true))
        .toList() ??
    [];
