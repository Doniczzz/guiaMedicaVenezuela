import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notificacion_record.g.dart';

abstract class NotificacionRecord
    implements Built<NotificacionRecord, NotificacionRecordBuilder> {
  static Serializer<NotificacionRecord> get serializer =>
      _$notificacionRecordSerializer;

  DocumentReference? get de;

  DocumentReference? get para;

  String? get mensaje;

  DateTime? get fecha;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NotificacionRecordBuilder builder) =>
      builder..mensaje = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacion');

  static Stream<NotificacionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotificacionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static NotificacionRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      NotificacionRecord(
        (c) => c
          ..de = safeGet(() => toRef(snapshot.data['de']))
          ..para = safeGet(() => toRef(snapshot.data['para']))
          ..mensaje = snapshot.data['mensaje']
          ..fecha = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['fecha']))
          ..ffRef = NotificacionRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<NotificacionRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'notificacion',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  NotificacionRecord._();
  factory NotificacionRecord(
          [void Function(NotificacionRecordBuilder) updates]) =
      _$NotificacionRecord;

  static NotificacionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotificacionRecordData({
  DocumentReference? de,
  DocumentReference? para,
  String? mensaje,
  DateTime? fecha,
}) {
  final firestoreData = serializers.toFirestore(
    NotificacionRecord.serializer,
    NotificacionRecord(
      (n) => n
        ..de = de
        ..para = para
        ..mensaje = mensaje
        ..fecha = fecha,
    ),
  );

  return firestoreData;
}
