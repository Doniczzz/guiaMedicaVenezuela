import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ciudades_record.g.dart';

abstract class CiudadesRecord
    implements Built<CiudadesRecord, CiudadesRecordBuilder> {
  static Serializer<CiudadesRecord> get serializer =>
      _$ciudadesRecordSerializer;

  String? get ciudad;

  BuiltList<DocumentReference>? get usuarios;

  BuiltList<DocumentReference>? get medicos;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CiudadesRecordBuilder builder) => builder
    ..ciudad = ''
    ..usuarios = ListBuilder()
    ..medicos = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ciudades')
          : FirebaseFirestore.instance.collectionGroup('ciudades');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('ciudades').doc();

  static Stream<CiudadesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CiudadesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CiudadesRecord._();
  factory CiudadesRecord([void Function(CiudadesRecordBuilder) updates]) =
      _$CiudadesRecord;

  static CiudadesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCiudadesRecordData({
  String? ciudad,
}) {
  final firestoreData = serializers.toFirestore(
    CiudadesRecord.serializer,
    CiudadesRecord(
      (c) => c
        ..ciudad = ciudad
        ..usuarios = null
        ..medicos = null,
    ),
  );

  return firestoreData;
}
