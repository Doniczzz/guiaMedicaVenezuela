import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mindscode_model.dart';
export 'mindscode_model.dart';

class MindscodeWidget extends StatefulWidget {
  const MindscodeWidget({Key? key}) : super(key: key);

  @override
  _MindscodeWidgetState createState() => _MindscodeWidgetState();
}

class _MindscodeWidgetState extends State<MindscodeWidget> {
  late MindscodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MindscodeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Creado por    ',
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Lexend',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontSize: 16.0,
                  ),
            ),
            Image.asset(
              'assets/images/prototipo.png',
              width: 30.0,
              height: 30.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ],
    );
  }
}
