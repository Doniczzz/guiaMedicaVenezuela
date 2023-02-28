import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/agregar_banco_widget.dart';
import '/components/agregar_pago_movil_widget.dart';
import '/components/agregar_zelle_widget.dart';
import '/components/multiples_dias_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CrearCitaModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  DateTime? unDia;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fechaOrFechas widget.
  String? fechaOrFechasValue;
  DateTime? datePicked;
  // State field(s) for especialidad widget.
  String? especialidadValue;
  // State field(s) for maxPacientes widget.
  TextEditingController? maxPacientesController;
  String? Function(BuildContext, String?)? maxPacientesControllerValidator;
  String? _maxPacientesControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for dolaresBolivares widget.
  String? dolaresBolivaresValue;
  // State field(s) for precioPacienteUs widget.
  TextEditingController? precioPacienteUsController;
  String? Function(BuildContext, String?)? precioPacienteUsControllerValidator;
  String? _precioPacienteUsControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CitasRecord? citaCreada;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    maxPacientesControllerValidator = _maxPacientesControllerValidator;
    precioPacienteUsControllerValidator = _precioPacienteUsControllerValidator;
  }

  void dispose() {
    maxPacientesController?.dispose();
    precioPacienteUsController?.dispose();
  }

  /// Additional helper methods are added here.

}
