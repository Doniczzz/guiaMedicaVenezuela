import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trans_escoger_moneda_model.dart';
export 'trans_escoger_moneda_model.dart';

class TransEscogerMonedaWidget extends StatefulWidget {
  const TransEscogerMonedaWidget({Key? key}) : super(key: key);

  @override
  _TransEscogerMonedaWidgetState createState() =>
      _TransEscogerMonedaWidgetState();
}

class _TransEscogerMonedaWidgetState extends State<TransEscogerMonedaWidget> {
  late TransEscogerMonedaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransEscogerMonedaModel());
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
      width: double.infinity,
      height: 238.4,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x3B1D2429),
            offset: Offset(0, -3),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Text(
                '¿Con que moneda deseas pagar?',
                style: FlutterFlowTheme.of(context).subtitle1,
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                setState(() {
                  _model.monedaSeleccionada = 'Bolívares';
                });
                Navigator.pop(context, _model.monedaSeleccionada);
              },
              text: 'Bolívares',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                color: FlutterFlowTheme.of(context).secondaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    _model.monedaSeleccionada = 'Dólares';
                  });
                  Navigator.pop(context, _model.monedaSeleccionada);
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: Container(
                          width: 30,
                          height: 30,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/zelle-logo-5.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                          child: Text(
                            'Dólares',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
