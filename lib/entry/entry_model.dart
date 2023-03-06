import '/components/mindscode_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class EntryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for mindscode component.
  late MindscodeModel mindscodeModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mindscodeModel = createModel(context, () => MindscodeModel());
  }

  void dispose() {
    mindscodeModel.dispose();
  }

  /// Additional helper methods are added here.

}
