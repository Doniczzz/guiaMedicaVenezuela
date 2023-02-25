import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'citas_record.g.dart';

abstract class CitasRecord implements Built<CitasRecord, CitasRecordBuilder> {
  static Serializer<CitasRecord> get serializer => _$citasRecordSerializer;

  DocumentReference? get medico;

  DateTime? get fecha;

  double? get precio;

  int? get maxCitas;

  String? get especialidad;

  String? get moneda;

  String? get moneda2;

  bool? get aceptaEfectivo;

  String? get tipoDeMoneda;

  BuiltList<PacientesStruct>? get pacientes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CitasRecordBuilder builder) => builder
    ..precio = 0.0
    ..maxCitas = 0
    ..especialidad = ''
    ..moneda = ''
    ..moneda2 = ''
    ..aceptaEfectivo = false
    ..tipoDeMoneda = ''
    ..pacientes = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('citas');

  static Stream<CitasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CitasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CitasRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => CitasRecord(
        (c) => c
          ..medico = safeGet(() => toRef(snapshot.data['medico']))
          ..fecha = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['fecha']))
          ..precio = snapshot.data['precio']?.toDouble()
          ..maxCitas = snapshot.data['maxCitas']?.round()
          ..especialidad = snapshot.data['especialidad']
          ..moneda = snapshot.data['moneda']
          ..moneda2 = snapshot.data['moneda2']
          ..aceptaEfectivo = snapshot.data['aceptaEfectivo']
          ..tipoDeMoneda = snapshot.data['tipoDeMoneda']
          ..pacientes = safeGet(() => ListBuilder(
              snapshot.data['pacientes'].map((data) => createPacientesStruct(
                    paciente: safeGet(() =>
                        toRef((data as Map<String, dynamic>)['paciente'])),
                    metodoPago: (data as Map<String, dynamic>)['metodoPago'],
                    numeroReferencia:
                        (data as Map<String, dynamic>)['numeroReferencia'],
                    comprobante: (data as Map<String, dynamic>)['comprobante'],
                    status: (data as Map<String, dynamic>)['status']?.round(),
                    cedula: (data as Map<String, dynamic>)['cedula']?.round(),
                    motivoCita: (data as Map<String, dynamic>)['motivoCita'],
                    tipoTransferencia:
                        (data as Map<String, dynamic>)['tipoTransferencia'],
                    nombrePaciente:
                        (data as Map<String, dynamic>)['nombrePaciente'],
                    create: true,
                    clearUnsetFields: false,
                  ).toBuilder())))
          ..ffRef = CitasRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CitasRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'citas',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CitasRecord._();
  factory CitasRecord([void Function(CitasRecordBuilder) updates]) =
      _$CitasRecord;

  static CitasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCitasRecordData({
  DocumentReference? medico,
  DateTime? fecha,
  double? precio,
  int? maxCitas,
  String? especialidad,
  String? moneda,
  String? moneda2,
  bool? aceptaEfectivo,
  String? tipoDeMoneda,
}) {
  final firestoreData = serializers.toFirestore(
    CitasRecord.serializer,
    CitasRecord(
      (c) => c
        ..medico = medico
        ..fecha = fecha
        ..precio = precio
        ..maxCitas = maxCitas
        ..especialidad = especialidad
        ..moneda = moneda
        ..moneda2 = moneda2
        ..aceptaEfectivo = aceptaEfectivo
        ..tipoDeMoneda = tipoDeMoneda
        ..pacientes = null,
    ),
  );

  return firestoreData;
}
