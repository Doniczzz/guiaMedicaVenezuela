import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'zelle_struct.g.dart';

abstract class ZelleStruct implements Built<ZelleStruct, ZelleStructBuilder> {
  static Serializer<ZelleStruct> get serializer => _$zelleStructSerializer;

  String? get nombre;

  String? get correo;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ZelleStructBuilder builder) => builder
    ..nombre = ''
    ..correo = ''
    ..firestoreUtilData = FirestoreUtilData();

  ZelleStruct._();
  factory ZelleStruct([void Function(ZelleStructBuilder) updates]) =
      _$ZelleStruct;
}

ZelleStruct createZelleStruct({
  String? nombre,
  String? correo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ZelleStruct(
      (z) => z
        ..nombre = nombre
        ..correo = correo
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ZelleStruct? updateZelleStruct(
  ZelleStruct? zelle, {
  bool clearUnsetFields = true,
}) =>
    zelle != null
        ? (zelle.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addZelleStructData(
  Map<String, dynamic> firestoreData,
  ZelleStruct? zelle,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (zelle == null) {
    return;
  }
  if (zelle.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && zelle.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final zelleData = getZelleFirestoreData(zelle, forFieldValue);
  final nestedData = zelleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = zelle.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getZelleFirestoreData(
  ZelleStruct? zelle, [
  bool forFieldValue = false,
]) {
  if (zelle == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(ZelleStruct.serializer, zelle);

  // Add any Firestore field values
  zelle.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getZelleListFirestoreData(
  List<ZelleStruct>? zelles,
) =>
    zelles?.map((z) => getZelleFirestoreData(z, true)).toList() ?? [];
