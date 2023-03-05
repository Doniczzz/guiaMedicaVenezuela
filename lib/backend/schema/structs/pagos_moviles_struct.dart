import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'pagos_moviles_struct.g.dart';

abstract class PagosMovilesStruct
    implements Built<PagosMovilesStruct, PagosMovilesStructBuilder> {
  static Serializer<PagosMovilesStruct> get serializer =>
      _$pagosMovilesStructSerializer;

  String? get nombre;

  String? get telefono;

  String? get banco;

  String? get cedula;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PagosMovilesStructBuilder builder) => builder
    ..nombre = ''
    ..telefono = ''
    ..banco = ''
    ..cedula = ''
    ..firestoreUtilData = FirestoreUtilData();

  PagosMovilesStruct._();
  factory PagosMovilesStruct(
          [void Function(PagosMovilesStructBuilder) updates]) =
      _$PagosMovilesStruct;
}

PagosMovilesStruct createPagosMovilesStruct({
  String? nombre,
  String? telefono,
  String? banco,
  String? cedula,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PagosMovilesStruct(
      (p) => p
        ..nombre = nombre
        ..telefono = telefono
        ..banco = banco
        ..cedula = cedula
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PagosMovilesStruct? updatePagosMovilesStruct(
  PagosMovilesStruct? pagosMoviles, {
  bool clearUnsetFields = true,
}) =>
    pagosMoviles != null
        ? (pagosMoviles.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPagosMovilesStructData(
  Map<String, dynamic> firestoreData,
  PagosMovilesStruct? pagosMoviles,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pagosMoviles == null) {
    return;
  }
  if (pagosMoviles.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && pagosMoviles.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pagosMovilesData =
      getPagosMovilesFirestoreData(pagosMoviles, forFieldValue);
  final nestedData =
      pagosMovilesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = pagosMoviles.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPagosMovilesFirestoreData(
  PagosMovilesStruct? pagosMoviles, [
  bool forFieldValue = false,
]) {
  if (pagosMoviles == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PagosMovilesStruct.serializer, pagosMoviles);

  // Add any Firestore field values
  pagosMoviles.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPagosMovilesListFirestoreData(
  List<PagosMovilesStruct>? pagosMoviless,
) =>
    pagosMoviless?.map((p) => getPagosMovilesFirestoreData(p, true)).toList() ??
    [];
