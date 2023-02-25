import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'publicidades_record.g.dart';

abstract class PublicidadesRecord
    implements Built<PublicidadesRecord, PublicidadesRecordBuilder> {
  static Serializer<PublicidadesRecord> get serializer =>
      _$publicidadesRecordSerializer;

  String? get titulo;

  String? get link;

  String? get descripcion;

  String? get img;

  double? get precio;

  bool? get status;

  InfoPublicidadStruct get infoPublicidad;

  DateTime? get fechaActivacion;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PublicidadesRecordBuilder builder) => builder
    ..titulo = ''
    ..link = ''
    ..descripcion = ''
    ..img = ''
    ..precio = 0.0
    ..status = false
    ..infoPublicidad = InfoPublicidadStructBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('publicidades');

  static Stream<PublicidadesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PublicidadesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PublicidadesRecord._();
  factory PublicidadesRecord(
          [void Function(PublicidadesRecordBuilder) updates]) =
      _$PublicidadesRecord;

  static PublicidadesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPublicidadesRecordData({
  String? titulo,
  String? link,
  String? descripcion,
  String? img,
  double? precio,
  bool? status,
  InfoPublicidadStruct? infoPublicidad,
  DateTime? fechaActivacion,
}) {
  final firestoreData = serializers.toFirestore(
    PublicidadesRecord.serializer,
    PublicidadesRecord(
      (p) => p
        ..titulo = titulo
        ..link = link
        ..descripcion = descripcion
        ..img = img
        ..precio = precio
        ..status = status
        ..infoPublicidad = InfoPublicidadStructBuilder()
        ..fechaActivacion = fechaActivacion,
    ),
  );

  // Handle nested data for "infoPublicidad" field.
  addInfoPublicidadStructData(firestoreData, infoPublicidad, 'infoPublicidad');

  return firestoreData;
}
