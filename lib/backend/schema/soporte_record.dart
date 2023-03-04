import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'soporte_record.g.dart';

abstract class SoporteRecord
    implements Built<SoporteRecord, SoporteRecordBuilder> {
  static Serializer<SoporteRecord> get serializer => _$soporteRecordSerializer;

  String? get texto;

  DocumentReference? get usuario;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SoporteRecordBuilder builder) =>
      builder..texto = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('soporte');

  static Stream<SoporteRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SoporteRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static SoporteRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SoporteRecord(
        (c) => c
          ..texto = snapshot.data['texto']
          ..usuario = safeGet(() => toRef(snapshot.data['usuario']))
          ..ffRef = SoporteRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SoporteRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'soporte',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  SoporteRecord._();
  factory SoporteRecord([void Function(SoporteRecordBuilder) updates]) =
      _$SoporteRecord;

  static SoporteRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSoporteRecordData({
  String? texto,
  DocumentReference? usuario,
}) {
  final firestoreData = serializers.toFirestore(
    SoporteRecord.serializer,
    SoporteRecord(
      (s) => s
        ..texto = texto
        ..usuario = usuario,
    ),
  );

  return firestoreData;
}
