import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nombre widget.
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  String? _nombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido.';
    }

    return null;
  }

  // State field(s) for instagram widget.
  TextEditingController? instagramController;
  String? Function(BuildContext, String?)? instagramControllerValidator;
  String? _instagramControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido.';
    }

    return null;
  }

  // State field(s) for whats widget.
  TextEditingController? whatsController;
  String? Function(BuildContext, String?)? whatsControllerValidator;
  String? _whatsControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido.';
    }

    return null;
  }

  // State field(s) for calle widget.
  TextEditingController? calleController;
  String? Function(BuildContext, String?)? calleControllerValidator;
  String? _calleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido.';
    }

    return null;
  }

  // State field(s) for altura widget.
  TextEditingController? alturaController;
  String? Function(BuildContext, String?)? alturaControllerValidator;
  String? _alturaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido.';
    }

    return null;
  }

  // State field(s) for referencia widget.
  TextEditingController? referenciaController;
  String? Function(BuildContext, String?)? referenciaControllerValidator;
  String? _referenciaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Este campo es requerido.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nombreControllerValidator = _nombreControllerValidator;
    instagramControllerValidator = _instagramControllerValidator;
    whatsControllerValidator = _whatsControllerValidator;
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
