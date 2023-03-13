import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cambiar_foto_medico_widget.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarMedicoModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String fotoMedico =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/6ktpgk4rkwis/perfil.png';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Bottom Sheet - cambiarFotoMedico] action in Button widget.
  String? foto;
  // State field(s) for nombre widget.
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  // State field(s) for instagram widget.
  TextEditingController? instagramController;
  String? Function(BuildContext, String?)? instagramControllerValidator;
  // State field(s) for whats widget.
  TextEditingController? whatsController;
  String? Function(BuildContext, String?)? whatsControllerValidator;
  // State field(s) for calle widget.
  TextEditingController? calleController;
  String? Function(BuildContext, String?)? calleControllerValidator;
  String? _calleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for altura widget.
  TextEditingController? alturaController;
  String? Function(BuildContext, String?)? alturaControllerValidator;
  String? _alturaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for referencia widget.
  TextEditingController? referenciaController;
  String? Function(BuildContext, String?)? referenciaControllerValidator;
  String? _referenciaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calleControllerValidator = _calleControllerValidator;
    alturaControllerValidator = _alturaControllerValidator;
    referenciaControllerValidator = _referenciaControllerValidator;
  }

  void dispose() {
    nombreController?.dispose();
    instagramController?.dispose();
    whatsController?.dispose();
    calleController?.dispose();
    alturaController?.dispose();
    referenciaController?.dispose();
  }

  /// Additional helper methods are added here.

}
