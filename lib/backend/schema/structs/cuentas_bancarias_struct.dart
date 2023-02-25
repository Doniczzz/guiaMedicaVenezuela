import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'cuentas_bancarias_struct.g.dart';

abstract class CuentasBancariasStruct
    implements Built<CuentasBancariasStruct, CuentasBancariasStructBuilder> {
  static Serializer<CuentasBancariasStruct> get serializer =>
      _$cuentasBancariasStructSerializer;

  @BuiltValueField(wireName: 'Nombre')
  String? get nombre;

  String? get cedula;

  int? get numeroCuenta;

  String? get banco;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(CuentasBancariasStructBuilder builder) =>
      builder
        ..nombre = ''
        ..cedula = ''
        ..numeroCuenta = 0
        ..banco = ''
        ..firestoreUtilData = FirestoreUtilData();

  CuentasBancariasStruct._();
  factory CuentasBancariasStruct(
          [void Function(CuentasBancariasStructBuilder) updates]) =
      _$CuentasBancariasStruct;
}

CuentasBancariasStruct createCuentasBancariasStruct({
  String? nombre,
  String? cedula,
  int? numeroCuenta,
  String? banco,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CuentasBancariasStruct(
      (c) => c
        ..nombre = nombre
        ..cedula = cedula
        ..numeroCuenta = numeroCuenta
        ..banco = banco
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

CuentasBancariasStruct? updateCuentasBancariasStruct(
  CuentasBancariasStruct? cuentasBancarias, {
  bool clearUnsetFields = true,
}) =>
    cuentasBancarias != null
        ? (cuentasBancarias.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addCuentasBancariasStructData(
  Map<String, dynamic> firestoreData,
  CuentasBancariasStruct? cuentasBancarias,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cuentasBancarias == null) {
    return;
  }
  if (cuentasBancarias.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && cuentasBancarias.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cuentasBancariasData =
      getCuentasBancariasFirestoreData(cuentasBancarias, forFieldValue);
  final nestedData =
      cuentasBancariasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = cuentasBancarias.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getCuentasBancariasFirestoreData(
  CuentasBancariasStruct? cuentasBancarias, [
  bool forFieldValue = false,
]) {
  if (cuentasBancarias == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(
      CuentasBancariasStruct.serializer, cuentasBancarias);

  // Add any Firestore field values
  cuentasBancarias.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCuentasBancariasListFirestoreData(
  List<CuentasBancariasStruct>? cuentasBancariass,
) =>
    cuentasBancariass
        ?.map((c) => getCuentasBancariasFirestoreData(c, true))
        .toList() ??
    [];
