import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

List<String>? listaImagenes(List<PublicidadesRecord> publicidades) {
  List<String> imgList = [];
  for (var publicidad in publicidades) {
    imgList.add(publicidad.img ?? "");
  }
  return imgList;
}

List<String>? listaTitulos(List<PublicidadesRecord> publicidades) {
  List<String> titulos = [];
  for (var publicidad in publicidades) {
    titulos.add(publicidad.titulo ?? "");
  }
  return titulos;
}

double sumaRatings(List<RatingsStruct>? listaRatings) {
  double resultado = 0;
  for (var i = 0; i < listaRatings!.length; i++) {
    resultado += listaRatings[i].rating!;
  }
  return resultado;
}

String listaToString(List<String> lista) {
  String lista_str = lista.join(', ');

  return lista_str;
}

PacientesStruct retornarPaciente(
  DocumentReference? authenticatedUser,
  CitasRecord? cita,
) {
  var paciente;
  for (var i = 0; i < cita!.pacientes!.length; i++) {
    if (cita.pacientes![i].paciente == authenticatedUser) {
      return cita.pacientes![i];
    }
  }
  return paciente;
}

List<DocumentReference> misCitas(
  DocumentReference? authenticatedUser,
  List<CitasRecord>? citas,
) {
  List<DocumentReference> referenciasDeDocumentos = [];
  for (var cita in citas!) {
    for (var i = 0; i < cita.pacientes!.length; i++) {
      if (cita.pacientes![i].paciente == authenticatedUser) {
        referenciasDeDocumentos.add(cita.reference);
      }
    }
  }
  return referenciasDeDocumentos;
}

String tiempoRestante(
  DateTime fechaCita,
  DateTime fechaActual,
) {
  Duration diff = fechaCita.difference(fechaActual);
  int days = diff.inDays;
  int hours = diff.inHours;

  if (days > 1) {
    return "$days días";
  } else {
    hours = hours % 24;
    return "$hours horas";
  }
}

double exchangeUsToVes(
  String bs,
  String us,
) {
  if (double.tryParse(bs) != null) {
    return double.parse(bs) * double.parse(us);
  } else {
    return 0;
  }
}

String retornarDia(DateTime date) {
  int dia = date.weekday;
  switch (dia) {
    case 1:
      return 'Lunes';
    case 2:
      return 'Martes';
    case 3:
      return 'Miércoles';
    case 4:
      return 'Jueves';
    case 5:
      return 'Viernes';
    case 6:
      return 'Sábado';
    case 7:
      return 'Domingo';
    default:
      return '';
  }
}

String? saludo(DateTime? horaActual) {
  // retorna "buenos dias" si la hora de horaActual esta entre las 0:00 y las 11:00
  if (horaActual == null) return null;
  if (horaActual.hour >= 0 && horaActual.hour < 12) {
    return 'Buenos días';
  } else if (horaActual.hour >= 12 && horaActual.hour < 19) {
    return 'Buenas tardes';
  } else {
    return 'Buenas noches';
  }
}

DocumentReference? citaMasCercana(
  List<CitasRecord> citas,
  DateTime fechaActual,
  DocumentReference? autehnticatedUser,
) {
  DocumentReference? citaMasCercana;
  Duration? duracionMasCorta;

  citas.forEach((cita) {
    final fechaCita = DateTime.parse(cita.fecha!.toIso8601String());
    final duracionCita = fechaCita.difference(fechaActual).abs();
    for (var i = 0; i < cita.pacientes!.length; i++) {
      if (cita.pacientes![i].paciente == autehnticatedUser) {
        if (duracionMasCorta == null || duracionCita < duracionMasCorta!) {
          citaMasCercana = cita.reference;
          duracionMasCorta = duracionCita;
        }
      }
    }
  });

  return citaMasCercana!;
}

List<DateTime> editListDates(
  List<DateTime> dates,
  DateTime horaDefinida,
) {
  List<DateTime> listaFechas = [];
  for (var i = 0; i < dates.length; i++) {
    DateTime fechaCompleta = DateTime(
        dates[i].year,
        dates[i].month,
        dates[i].day,
        horaDefinida.hour,
        horaDefinida.minute,
        horaDefinida.second,
        horaDefinida.microsecond);
    listaFechas.add(fechaCompleta);
  }
  return listaFechas;
}

String? retornarMes(DateTime? dates) {
  return (DateFormat.MMMM('es').format(dates!));
}

int nPaciente(
  DocumentReference? authenticatedUser,
  CitasRecord? cita,
) {
  var paciente;
  for (var i = 0; i < cita!.pacientes!.length; i++) {
    if (cita.pacientes![i].paciente == authenticatedUser) {
      return i + 1;
    }
  }
  return 0;
}

PacientesStruct retornarPacienteReferencia(
  String? referencia,
  CitasRecord? cita,
) {
  var paciente;
  for (var i = 0; i < cita!.pacientes!.length; i++) {
    if (cita.pacientes![i].numeroReferencia == referencia) {
      return cita.pacientes![i];
    }
  }
  return paciente;
}

int? numeroDia(DateTime? date) {
  return date!.day;
}

bool? filtroCitas(
  DocumentReference? authenticatedUser,
  List<CitasRecord>? citas,
) {
  for (var cita in citas!) {
    for (var i = 0; i < cita.pacientes!.length; i++) {
      if (cita.pacientes![i].paciente == authenticatedUser) {
        return true;
      }
    }
  }
  return false;
}

bool? pacienteEnCita(
  DocumentReference? usuario,
  List<PacientesStruct>? pacientes,
) {
  for (var paciente in pacientes!) {
    if (paciente.paciente == usuario) {
      return true;
    }
  }
  return false;
}
