import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/mindscode_widget.dart';
import '../components/recuperar_contrasena_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for displayName widget.
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for emailAddress-Create widget.
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  // State field(s) for password-Create widget.
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  // Model for mindscode component.
  late MindscodeModel mindscodeModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordCreateVisibility = false;
    mindscodeModel = createModel(context, () => MindscodeModel());
  }

  void dispose() {
    emailAddressController?.dispose();
    passwordController?.dispose();
    displayNameController?.dispose();
    emailAddressCreateController?.dispose();
    passwordCreateController?.dispose();
    mindscodeModel.dispose();
  }

  /// Additional helper methods are added here.

}
