import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/buscar_codigo_widget.dart';
import '/components/cita_widget.dart';
import '/components/enviar_soporte_widget.dart';
import '/components/loading_widget.dart';
import '/components/mindscode_logo_widget.dart';
import '/components/mis_citas_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool menuAbierto = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  MedicosRecord? med;
  // Model for mindscodeLogo component.
  late MindscodeLogoModel mindscodeLogoModel;
  // Model for misCitasComp component.
  late MisCitasCompModel misCitasCompModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mindscodeLogoModel = createModel(context, () => MindscodeLogoModel());
    misCitasCompModel = createModel(context, () => MisCitasCompModel());
  }

  void dispose() {
    mindscodeLogoModel.dispose();
    misCitasCompModel.dispose();
  }

  /// Additional helper methods are added here.

}
