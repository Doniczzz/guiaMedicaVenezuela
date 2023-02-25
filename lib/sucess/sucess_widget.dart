import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'sucess_model.dart';
export 'sucess_model.dart';

class SucessWidget extends StatefulWidget {
  const SucessWidget({
    Key? key,
    int? numeroPaciente,
    String? especialidad,
    String? medicoNombre,
    String? nReferencia,
    int? status,
  })  : this.numeroPaciente = numeroPaciente ?? 0,
        this.especialidad = especialidad ?? 'Sin definir',
        this.medicoNombre = medicoNombre ?? 'Sin definir',
        this.nReferencia = nReferencia ?? '0',
        this.status = status ?? 0,
        super(key: key);

  final int numeroPaciente;
  final String especialidad;
  final String medicoNombre;
  final String nReferencia;
  final int status;

  @override
  _SucessWidgetState createState() => _SucessWidgetState();
}

class _SucessWidgetState extends State<SucessWidget> {
  late SucessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SucessModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 25, 16, 25),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/lottie_animations/89618-gopay-succesfull-payment.json',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                        frameRate: FrameRate(60),
                        repeat: false,
                        animate: true,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Has agendado una nueva cita con el médico ${widget.medicoNombre}',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 30,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Text(
                    '¡Gracias por usar nuestra aplicación!',
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(
                        'home',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.leftToRight,
                          ),
                        },
                      );
                    },
                    text: 'Aceptar',
                    options: FFButtonOptions(
                      width: 130,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'DM Sans',
                            color: FlutterFlowTheme.of(context).secondaryColor,
                          ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                if (widget.status == 2)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text(
                      'Eres el paciente #${widget.numeroPaciente.toString()} en ${widget.especialidad}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Lexend',
                            color: Color(0xFF00E539),
                          ),
                    ),
                  ),
                if (widget.status == 1)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text(
                      'Tu pago está revisandose.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Lexend',
                            color: Color(0xFFFFFF74),
                          ),
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Muestra este número de referencia al llegar: ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: widget.nReferencia,
                              style: TextStyle(
                                color: Color(0xFF00E539),
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).gray200,
                                fontSize: 25,
                              ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
