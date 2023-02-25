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
import 'buscar_codigo_model.dart';
export 'buscar_codigo_model.dart';

class BuscarCodigoWidget extends StatefulWidget {
  const BuscarCodigoWidget({Key? key}) : super(key: key);

  @override
  _BuscarCodigoWidgetState createState() => _BuscarCodigoWidgetState();
}

class _BuscarCodigoWidgetState extends State<BuscarCodigoWidget>
    with TickerProviderStateMixin {
  late BuscarCodigoModel _model;

  final animationsMap = {
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(-400, 0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(400, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscarCodigoModel());

    _model.nReferenciaController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      height: 280,
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
            FFButtonWidget(
              onPressed: () async {
                _model.nReferencia = await FlutterBarcodeScanner.scanBarcode(
                  '#C62828', // scanning line color
                  'Cancel', // cancel button text
                  true, // whether to show the flash icon
                  ScanMode.QR,
                );

                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: BuscarPacienteWidget(
                        nReferencia: _model.nReferencia,
                      ),
                    );
                  },
                ).then((value) => setState(() {}));

                setState(() {});
              },
              text: 'Escanear QR',
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
            Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (animationsMap['buttonOnActionTriggerAnimation'] !=
                          null) {
                        animationsMap['buttonOnActionTriggerAnimation']!
                            .controller
                            .forward(from: 0.0);
                      }
                      if (animationsMap['containerOnActionTriggerAnimation'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation']!
                            .controller
                            .forward(from: 0.0);
                      }
                    },
                    text: 'Ingresar Manualmente',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
                      color: FlutterFlowTheme.of(context).secondaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                  ).animateOnActionTrigger(
                    animationsMap['buttonOnActionTriggerAnimation']!,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 61.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).grayIcon,
                        width: 0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.qr_code,
                            color: FlutterFlowTheme.of(context).gray600,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: TextFormField(
                                controller: _model.nReferenciaController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.nReferenciaController',
                                  Duration(milliseconds: 1000),
                                  () => setState(() {}),
                                ),
                                onFieldSubmitted: (_) async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: BuscarPacienteWidget(
                                          nReferencia:
                                              _model.nReferenciaController.text,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Número de referencia',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'DM Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                        fontSize: 15,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                keyboardType: TextInputType.number,
                                validator: _model.nReferenciaControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                              ),
                            ),
                          ),
                          if (_model.nReferenciaController.text != null &&
                              _model.nReferenciaController.text != '')
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.check_circle,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: BuscarPacienteWidget(
                                        nReferencia:
                                            _model.nReferenciaController.text,
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                            ),
                        ],
                      ),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation']!,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Cerrar',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  textStyle: FlutterFlowTheme.of(context).subtitle2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
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
