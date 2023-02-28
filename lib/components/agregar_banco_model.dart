import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AgregarBancoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombreBanco widget.
  TextEditingController? nombreBancoController;
  String? Function(BuildContext, String?)? nombreBancoControllerValidator;
  String? _nombreBancoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for numeroCuenta widget.
  TextEditingController? numeroCuentaController;
  String? Function(BuildContext, String?)? numeroCuentaControllerValidator;
  String? _numeroCuentaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for nombreTitular widget.
  TextEditingController? nombreTitularController;
  String? Function(BuildContext, String?)? nombreTitularControllerValidator;
  String? _nombreTitularControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  // State field(s) for cedulaTitular widget.
  TextEditingController? cedulaTitularController;
  String? Function(BuildContext, String?)? cedulaTitularControllerValidator;
  String? _cedulaTitularControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nombreBancoControllerValidator = _nombreBancoControllerValidator;
    numeroCuentaControllerValidator = _numeroCuentaControllerValidator;
    nombreTitularControllerValidator = _nombreTitularControllerValidator;
    cedulaTitularControllerValidator = _cedulaTitularControllerValidator;
  }

  void dispose() {
    nombreBancoController?.dispose();
    numeroCuentaController?.dispose();
    nombreTitularController?.dispose();
    cedulaTitularController?.dispose();
  }

  /// Additional helper methods are added here.

}
