import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

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

  static PublicidadesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PublicidadesRecord(
        (c) => c
          ..titulo = snapshot.data['titulo']
          ..link = snapshot.data['link']
          ..descripcion = snapshot.data['descripcion']
          ..img = snapshot.data['img']
          ..precio = snapshot.data['precio']?.toDouble()
          ..status = snapshot.data['status']
          ..infoPublicidad = createInfoPublicidadStruct(
            nombre: (snapshot.data['infoPublicidad'] ?? {})['nombre'],
            telefono: (snapshot.data['infoPublicidad'] ?? {})['telefono'],
            correo: (snapshot.data['infoPublicidad'] ?? {})['correo'],
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..fechaActivacion = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['fechaActivacion']))
          ..ffRef = PublicidadesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PublicidadesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'publicidades',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
