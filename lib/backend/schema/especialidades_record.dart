import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'especialidades_record.g.dart';

abstract class EspecialidadesRecord
    implements Built<EspecialidadesRecord, EspecialidadesRecordBuilder> {
  static Serializer<EspecialidadesRecord> get serializer =>
      _$especialidadesRecordSerializer;

  String? get especialidad;

  BuiltList<DocumentReference>? get medicos;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EspecialidadesRecordBuilder builder) => builder
    ..especialidad = ''
    ..medicos = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('especialidades');

  static Stream<EspecialidadesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EspecialidadesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static EspecialidadesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EspecialidadesRecord(
        (c) => c
          ..especialidad = snapshot.data['especialidad']
          ..medicos = safeGet(
              () => ListBuilder(snapshot.data['medicos'].map((s) => toRef(s))))
          ..ffRef = EspecialidadesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EspecialidadesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'especialidades',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  EspecialidadesRecord._();
  factory EspecialidadesRecord(
          [void Function(EspecialidadesRecordBuilder) updates]) =
      _$EspecialidadesRecord;

  static EspecialidadesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEspecialidadesRecordData({
  String? especialidad,
}) {
  final firestoreData = serializers.toFirestore(
    EspecialidadesRecord.serializer,
    EspecialidadesRecord(
      (e) => e
        ..especialidad = especialidad
        ..medicos = null,
    ),
  );

  return firestoreData;
}
