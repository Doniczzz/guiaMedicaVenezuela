import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'donde_vive_struct.g.dart';

abstract class DondeViveStruct
    implements Built<DondeViveStruct, DondeViveStructBuilder> {
  static Serializer<DondeViveStruct> get serializer =>
      _$dondeViveStructSerializer;

  DocumentReference? get estado;

  DocumentReference? get ciudad;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DondeViveStructBuilder builder) =>
      builder..firestoreUtilData = FirestoreUtilData();

  DondeViveStruct._();
  factory DondeViveStruct([void Function(DondeViveStructBuilder) updates]) =
      _$DondeViveStruct;
}

DondeViveStruct createDondeViveStruct({
  DocumentReference? estado,
  DocumentReference? ciudad,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DondeViveStruct(
      (d) => d
        ..estado = estado
        ..ciudad = ciudad
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DondeViveStruct? updateDondeViveStruct(
  DondeViveStruct? dondeVive, {
  bool clearUnsetFields = true,
}) =>
    dondeVive != null
        ? (dondeVive.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDondeViveStructData(
  Map<String, dynamic> firestoreData,
  DondeViveStruct? dondeVive,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dondeVive == null) {
    return;
  }
  if (dondeVive.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && dondeVive.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dondeViveData = getDondeViveFirestoreData(dondeVive, forFieldValue);
  final nestedData = dondeViveData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = dondeVive.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDondeViveFirestoreData(
  DondeViveStruct? dondeVive, [
  bool forFieldValue = false,
]) {
  if (dondeVive == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(DondeViveStruct.serializer, dondeVive);

  // Add any Firestore field values
  dondeVive.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDondeViveListFirestoreData(
  List<DondeViveStruct>? dondeVives,
) =>
    dondeVives?.map((d) => getDondeViveFirestoreData(d, true)).toList() ?? [];
