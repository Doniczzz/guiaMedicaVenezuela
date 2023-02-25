import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'direccion_struct.g.dart';

abstract class DireccionStruct
    implements Built<DireccionStruct, DireccionStructBuilder> {
  static Serializer<DireccionStruct> get serializer =>
      _$direccionStructSerializer;

  @BuiltValueField(wireName: 'calle_avenida')
  String? get calleAvenida;

  String? get altura;

  String? get referencia;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DireccionStructBuilder builder) => builder
    ..calleAvenida = ''
    ..altura = ''
    ..referencia = ''
    ..firestoreUtilData = FirestoreUtilData();

  DireccionStruct._();
  factory DireccionStruct([void Function(DireccionStructBuilder) updates]) =
      _$DireccionStruct;
}

DireccionStruct createDireccionStruct({
  String? calleAvenida,
  String? altura,
  String? referencia,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DireccionStruct(
      (d) => d
        ..calleAvenida = calleAvenida
        ..altura = altura
        ..referencia = referencia
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DireccionStruct? updateDireccionStruct(
  DireccionStruct? direccion, {
  bool clearUnsetFields = true,
}) =>
    direccion != null
        ? (direccion.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDireccionStructData(
  Map<String, dynamic> firestoreData,
  DireccionStruct? direccion,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (direccion == null) {
    return;
  }
  if (direccion.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && direccion.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final direccionData = getDireccionFirestoreData(direccion, forFieldValue);
  final nestedData = direccionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = direccion.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDireccionFirestoreData(
  DireccionStruct? direccion, [
  bool forFieldValue = false,
]) {
  if (direccion == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(DireccionStruct.serializer, direccion);

  // Add any Firestore field values
  direccion.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDireccionListFirestoreData(
  List<DireccionStruct>? direccions,
) =>
    direccions?.map((d) => getDireccionFirestoreData(d, true)).toList() ?? [];
