import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'admin_record.g.dart';

abstract class AdminRecord implements Built<AdminRecord, AdminRecordBuilder> {
  static Serializer<AdminRecord> get serializer => _$adminRecordSerializer;

  DocumentReference? get user;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AdminRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin');

  static Stream<AdminRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AdminRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static AdminRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => AdminRecord(
        (c) => c
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..ffRef = AdminRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<AdminRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'admin',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  AdminRecord._();
  factory AdminRecord([void Function(AdminRecordBuilder) updates]) =
      _$AdminRecord;

  static AdminRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAdminRecordData({
  DocumentReference? user,
}) {
  final firestoreData = serializers.toFirestore(
    AdminRecord.serializer,
    AdminRecord(
      (a) => a..user = user,
    ),
  );

  return firestoreData;
}
