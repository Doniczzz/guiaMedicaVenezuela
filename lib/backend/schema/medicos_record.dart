import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'medicos_record.g.dart';

abstract class MedicosRecord
    implements Built<MedicosRecord, MedicosRecordBuilder> {
  static Serializer<MedicosRecord> get serializer => _$medicosRecordSerializer;

  DireccionStruct get direccion;

  BuiltList<PagosMovilesStruct>? get pagosMovil;

  BuiltList<CuentasBancariasStruct>? get cuentasBancarias;

  ZelleStruct get cuentaZelle;

  BuiltList<DocumentReference>? get citasCreadas;

  double? get rating;

  DondeViveStruct get ubicacion;

  BuiltList<RatingsStruct>? get ratings;

  BuiltList<String>? get especialidades;

  String? get nombre;

  bool? get mostrarWhatsapp;

  String? get whatsapp;

  String? get instagram;

  String? get foto;

  String? get email;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(MedicosRecordBuilder builder) => builder
    ..direccion = DireccionStructBuilder()
    ..pagosMovil = ListBuilder()
    ..cuentasBancarias = ListBuilder()
    ..cuentaZelle = ZelleStructBuilder()
    ..citasCreadas = ListBuilder()
    ..rating = 0.0
    ..ubicacion = DondeViveStructBuilder()
    ..ratings = ListBuilder()
    ..especialidades = ListBuilder()
    ..nombre = ''
    ..mostrarWhatsapp = false
    ..whatsapp = ''
    ..instagram = ''
    ..foto = ''
    ..email = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('medicos')
          : FirebaseFirestore.instance.collectionGroup('medicos');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('medicos').doc();

  static Stream<MedicosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MedicosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MedicosRecord._();
  factory MedicosRecord([void Function(MedicosRecordBuilder) updates]) =
      _$MedicosRecord;

  static MedicosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMedicosRecordData({
  DireccionStruct? direccion,
  ZelleStruct? cuentaZelle,
  double? rating,
  DondeViveStruct? ubicacion,
  String? nombre,
  bool? mostrarWhatsapp,
  String? whatsapp,
  String? instagram,
  String? foto,
  String? email,
}) {
  final firestoreData = serializers.toFirestore(
    MedicosRecord.serializer,
    MedicosRecord(
      (m) => m
        ..direccion = DireccionStructBuilder()
        ..pagosMovil = null
        ..cuentasBancarias = null
        ..cuentaZelle = ZelleStructBuilder()
        ..citasCreadas = null
        ..rating = rating
        ..ubicacion = DondeViveStructBuilder()
        ..ratings = null
        ..especialidades = null
        ..nombre = nombre
        ..mostrarWhatsapp = mostrarWhatsapp
        ..whatsapp = whatsapp
        ..instagram = instagram
        ..foto = foto
        ..email = email,
    ),
  );

  // Handle nested data for "direccion" field.
  addDireccionStructData(firestoreData, direccion, 'direccion');

  // Handle nested data for "cuentaZelle" field.
  addZelleStructData(firestoreData, cuentaZelle, 'cuentaZelle');

  // Handle nested data for "ubicacion" field.
  addDondeViveStructData(firestoreData, ubicacion, 'ubicacion');

  return firestoreData;
}
