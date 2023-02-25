import '../components/buscar_paciente_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuscarCodigoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  var nReferencia = '';
  // State field(s) for nReferencia widget.
  TextEditingController? nReferenciaController;
  String? Function(BuildContext, String?)? nReferenciaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nReferenciaController?.dispose();
  }

  /// Additional helper methods are added here.

}
