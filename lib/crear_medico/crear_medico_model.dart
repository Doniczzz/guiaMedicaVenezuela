import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CrearMedicoModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> especialidades = [];
  void addToEspecialidades(String item) => especialidades.add(item);
  void removeFromEspecialidades(String item) => especialidades.remove(item);
  void removeAtIndexFromEspecialidades(int index) =>
      especialidades.removeAt(index);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for nombre widget.
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  // State field(s) for whats widget.
  TextEditingController? whatsController;
  String? Function(BuildContext, String?)? whatsControllerValidator;
  // State field(s) for calle widget.
  TextEditingController? calleController;
  String? Function(BuildContext, String?)? calleControllerValidator;
  // State field(s) for altura widget.
  TextEditingController? alturaController;
  String? Function(BuildContext, String?)? alturaControllerValidator;
  // State field(s) for referencia widget.
  TextEditingController? referenciaController;
  String? Function(BuildContext, String?)? referenciaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nombreController?.dispose();
    whatsController?.dispose();
    calleController?.dispose();
    alturaController?.dispose();
    referenciaController?.dispose();
  }

  /// Additional helper methods are added here.

}
