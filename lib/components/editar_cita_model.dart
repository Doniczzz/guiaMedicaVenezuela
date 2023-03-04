import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarCitaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for especialidad widget.
  String? especialidadValue;
  // State field(s) for maxPacientes widget.
  TextEditingController? maxPacientesController;
  String? Function(BuildContext, String?)? maxPacientesControllerValidator;
  // State field(s) for dolaresBolivares widget.
  String? dolaresBolivaresValue;
  // State field(s) for precioPacienteUs widget.
  TextEditingController? precioPacienteUsController;
  String? Function(BuildContext, String?)? precioPacienteUsControllerValidator;
  // State field(s) for efectivoBoolean widget.
  bool? efectivoBooleanValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    maxPacientesController?.dispose();
    precioPacienteUsController?.dispose();
  }

  /// Additional helper methods are added here.

}
