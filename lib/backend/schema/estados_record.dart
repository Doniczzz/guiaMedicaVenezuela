import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'estados_record.g.dart';

abstract class EstadosRecord
    implements Built<EstadosRecord, EstadosRecordBuilder> {
  static Serializer<EstadosRecord> get serializer => _$estadosRecordSerializer;

  String? get estado;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(EstadosRecordBuilder builder) =>
      builder..estado = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('estados');

  static Stream<EstadosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<EstadosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static EstadosRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      EstadosRecord(
        (c) => c
          ..estado = snapshot.data['estado']
          ..ffRef = EstadosRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<EstadosRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'estados',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  EstadosRecord._();
  factory EstadosRecord([void Function(EstadosRecordBuilder) updates]) =
      _$EstadosRecord;

  static EstadosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createEstadosRecordData({
  String? estado,
}) {
  final firestoreData = serializers.toFirestore(
    EstadosRecord.serializer,
    EstadosRecord(
      (e) => e..estado = estado,
    ),
  );

  return firestoreData;
}
