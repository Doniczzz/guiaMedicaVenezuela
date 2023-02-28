import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_estado_model.dart';
export 'loading_estado_model.dart';

class LoadingEstadoWidget extends StatefulWidget {
  const LoadingEstadoWidget({Key? key}) : super(key: key);

  @override
  _LoadingEstadoWidgetState createState() => _LoadingEstadoWidgetState();
}

class _LoadingEstadoWidgetState extends State<LoadingEstadoWidget> {
  late LoadingEstadoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingEstadoModel());
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
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie_animations/9796-shop-loading.json',
            width: 250.0,
            height: 250.0,
            fit: BoxFit.cover,
            animate: true,
          ),
          Text(
            'CARGANDO...',
            style: FlutterFlowTheme.of(context).title3.override(
                  fontFamily: 'Lexend',
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
