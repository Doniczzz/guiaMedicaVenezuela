import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shimmer_v_model.dart';
export 'shimmer_v_model.dart';

class ShimmerVWidget extends StatefulWidget {
  const ShimmerVWidget({Key? key}) : super(key: key);

  @override
  _ShimmerVWidgetState createState() => _ShimmerVWidgetState();
}

class _ShimmerVWidgetState extends State<ShimmerVWidget> {
  late ShimmerVModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShimmerVModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 445.2,
      height: 725.2,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Container(
        width: 445.2,
        height: 720.0,
        child: custom_widgets.Skeleton(
          width: 445.2,
          height: 720.0,
        ),
      ),
    );
  }
}
