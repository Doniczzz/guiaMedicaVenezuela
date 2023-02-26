import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/paranetry.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'entry': ParameterData.none(),
  'login': ParameterData.none(),
  'registro': (data) async => ParameterData(
        allParams: {
          'tieneEstado': getParameter<bool>(data, 'tieneEstado'),
        },
      ),
  'listaEstados': (data) async => ParameterData(
        allParams: {
          'editandoPerfil': getParameter<bool>(data, 'editandoPerfil'),
        },
      ),
  'listaCiudades': (data) async => ParameterData(
        allParams: {
          'estado': getParameter<DocumentReference>(data, 'estado'),
          'editandoPerfil': getParameter<bool>(data, 'editandoPerfil'),
        },
      ),
  'citasCreadas': (data) async => ParameterData(
        allParams: {
          'medico': getParameter<DocumentReference>(data, 'medico'),
        },
      ),
  'crearCita': (data) async => ParameterData(
        allParams: {
          'medico': getParameter<DocumentReference>(data, 'medico'),
        },
      ),
  'pacientes': (data) async => ParameterData(
        allParams: {
          'cita': await getDocumentParameter<CitasRecord>(
              data, 'cita', CitasRecord.serializer),
        },
      ),
  'citasCaducadas': (data) async => ParameterData(
        allParams: {
          'medico': getParameter<DocumentReference>(data, 'medico'),
        },
      ),
  'home': ParameterData.none(),
  'buscarEspecialidades': ParameterData.none(),
  'buscarMedicos': (data) async => ParameterData(
        allParams: {
          'ciudad': await getDocumentParameter<CiudadesRecord>(
              data, 'ciudad', CiudadesRecord.serializer),
        },
      ),
  'medico': (data) async => ParameterData(
        allParams: {
          'medico': getParameter<DocumentReference>(data, 'medico'),
        },
      ),
  'sucess': (data) async => ParameterData(
        allParams: {
          'numeroPaciente': getParameter<int>(data, 'numeroPaciente'),
          'especialidad': getParameter<String>(data, 'especialidad'),
          'medicoNombre': getParameter<String>(data, 'medicoNombre'),
          'nReferencia': getParameter<String>(data, 'nReferencia'),
          'status': getParameter<int>(data, 'status'),
        },
      ),
  'citaCliente': (data) async => ParameterData(
        allParams: {
          'medico': getParameter<DocumentReference>(data, 'medico'),
          'cita': getParameter<DocumentReference>(data, 'cita'),
        },
      ),
  'misCitas': ParameterData.none(),
  'estados': ParameterData.none(),
  'pacienteBuscado': (data) async => ParameterData(
        allParams: {
          'cita': getParameter<DocumentReference>(data, 'cita'),
          'nReferencia': getParameter<String>(data, 'nReferencia'),
        },
      ),
  'ciudades': (data) async => ParameterData(
        allParams: {
          'estado': getParameter<DocumentReference>(data, 'estado'),
        },
      ),
  'miCuenta': ParameterData.none(),
  'notificaciones': ParameterData.none(),
  'seleccionarEspecialidad': (data) async => ParameterData(
        allParams: {
          'medico': await getDocumentParameter<MedicosRecord>(
              data, 'medico', MedicosRecord.serializer),
        },
      ),
  'crearMedico': (data) async => ParameterData(
        allParams: {
          'medico': await getDocumentParameter<MedicosRecord>(
              data, 'medico', MedicosRecord.serializer),
        },
      ),
  'buscarMedicosEspecialidad': (data) async => ParameterData(
        allParams: {
          'especialidad': await getDocumentParameter<EspecialidadesRecord>(
              data, 'especialidad', EspecialidadesRecord.serializer),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
