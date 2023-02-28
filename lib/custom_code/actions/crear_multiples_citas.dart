// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future crearMultiplesCitas(
  DocumentReference? medico,
  double? precio,
  int? maxCitas,
  String? especialidad,
  bool? aceptaEfectivo,
  List<DateTime>? listaFechas,
  String? tipoDeMoneda,
) async {
  for (var fechaCita in listaFechas!) {
    String moneda = tipoDeMoneda == 'Bolívares' ? 'Bolívares' : 'Dólares';
    String? monedaDos = tipoDeMoneda == 'Ambos' ? 'Bolívares' : null;

    final nuevaCita = await FirebaseFirestore.instance.collection('citas').add({
      'medico': medico,
      'fecha': fechaCita,
      'precio': precio,
      'maxCitas': maxCitas,
      'especialidad': especialidad,
      'moneda': moneda,
      'moneda2': monedaDos,
      'aceptaEfectivo': aceptaEfectivo,
      'tipoDeMoneda': tipoDeMoneda,
    });

    await medico?.update({
      'citasCreadas': FieldValue.arrayUnion([nuevaCita])
    });
  }
}
