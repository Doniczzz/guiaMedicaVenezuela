import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/eliminar_cuenta_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarMiCuentaModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nombre widget.
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  // State field(s) for whats widget.
  TextEditingController? whatsController;
  String? Function(BuildContext, String?)? whatsControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nombreController?.dispose();
    whatsController?.dispose();
  }

  /// Additional helper methods are added here.

}
