import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  DatosPersonalesStruct get datosPersonales;

  DondeViveStruct get dondeVive;

  bool? get pushNotification;

  BuiltList<DocumentReference>? get notificaciones;

  bool? get habilitado;

  bool? get registro;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..datosPersonales = DatosPersonalesStructBuilder()
    ..dondeVive = DondeViveStructBuilder()
    ..pushNotification = false
    ..notificaciones = ListBuilder()
    ..habilitado = false
    ..registro = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => UsersRecord(
        (c) => c
          ..email = snapshot.data['email']
          ..displayName = snapshot.data['display_name']
          ..photoUrl = snapshot.data['photo_url']
          ..uid = snapshot.data['uid']
          ..createdTime = safeGet(() => DateTime.fromMillisecondsSinceEpoch(
              snapshot.data['created_time']))
          ..phoneNumber = snapshot.data['phone_number']
          ..datosPersonales = createDatosPersonalesStruct(
            telefono: (snapshot.data['datosPersonales'] ?? {})['telefono'],
            cedula: (snapshot.data['datosPersonales'] ?? {})['cedula'],
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..dondeVive = createDondeViveStruct(
            estado: safeGet(
                () => toRef((snapshot.data['dondeVive'] ?? {})['estado'])),
            ciudad: safeGet(
                () => toRef((snapshot.data['dondeVive'] ?? {})['ciudad'])),
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..pushNotification = snapshot.data['pushNotification']
          ..notificaciones = safeGet(() =>
              ListBuilder(snapshot.data['notificaciones'].map((s) => toRef(s))))
          ..habilitado = snapshot.data['habilitado']
          ..registro = snapshot.data['registro']
          ..ffRef = UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DatosPersonalesStruct? datosPersonales,
  DondeViveStruct? dondeVive,
  bool? pushNotification,
  bool? habilitado,
  bool? registro,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..datosPersonales = DatosPersonalesStructBuilder()
        ..dondeVive = DondeViveStructBuilder()
        ..pushNotification = pushNotification
        ..notificaciones = null
        ..habilitado = habilitado
        ..registro = registro,
    ),
  );

  // Handle nested data for "datosPersonales" field.
  addDatosPersonalesStructData(
      firestoreData, datosPersonales, 'datosPersonales');

  // Handle nested data for "dondeVive" field.
  addDondeViveStructData(firestoreData, dondeVive, 'dondeVive');

  return firestoreData;
}
