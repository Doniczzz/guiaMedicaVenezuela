import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mindscode_logo_model.dart';
export 'mindscode_logo_model.dart';

class MindscodeLogoWidget extends StatefulWidget {
  const MindscodeLogoWidget({Key? key}) : super(key: key);

  @override
  _MindscodeLogoWidgetState createState() => _MindscodeLogoWidgetState();
}

class _MindscodeLogoWidgetState extends State<MindscodeLogoWidget> {
  late MindscodeLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MindscodeLogoModel());
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
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/prototipo.png',
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
