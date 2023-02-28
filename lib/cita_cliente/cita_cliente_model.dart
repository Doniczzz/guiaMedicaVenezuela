import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/cuentas_bancarias_widget.dart';
import '/components/pago_movil_widget.dart';
import '/components/trans_escoger_moneda_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
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
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CitaClienteModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? paraQuienCita = 'Sin definir';

  String? metodoPago = 'Sin Definir';

  String? tipoTransferencia;

  String? nReferencia = '0';

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for paraQuienCita widget.
  String? paraQuienCitaValue;
  // State field(s) for nombre widget.
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  // State field(s) for cedula widget.
  TextEditingController? cedulaController;
  String? Function(BuildContext, String?)? cedulaControllerValidator;
  // State field(s) for motivoCita widget.
  TextEditingController? motivoCitaController;
  String? Function(BuildContext, String?)? motivoCitaControllerValidator;
  // Stores action output result for [Bottom Sheet - transEscogerMoneda] action in Button widget.
  String? text;
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nombreController?.dispose();
    cedulaController?.dispose();
    motivoCitaController?.dispose();
  }

  /// Additional helper methods are added here.

}
