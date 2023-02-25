import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cuentas_bancarias_model.dart';
export 'cuentas_bancarias_model.dart';

class CuentasBancariasWidget extends StatefulWidget {
  const CuentasBancariasWidget({
    Key? key,
    this.medico,
    this.totalPagar,
  }) : super(key: key);

  final DocumentReference? medico;
  final double? totalPagar;

  @override
  _CuentasBancariasWidgetState createState() => _CuentasBancariasWidgetState();
}

class _CuentasBancariasWidgetState extends State<CuentasBancariasWidget>
    with TickerProviderStateMixin {
  late CuentasBancariasModel _model;

  final animationsMap = {
    'columnOnActionTriggerAnimation1': AnimationInfo(
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
    'columnOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(450, 0),
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
    _model = createModel(context, () => CuentasBancariasModel());

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

    return StreamBuilder<MedicosRecord>(
      stream: MedicosRecord.getDocument(widget.medico!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final containerMedicosRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 547.5,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryColor,
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 50, 16, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Selecciona a que banco transferir por banco.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.account_balance,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 34,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Builder(
                          builder: (context) {
                            final bancos = containerMedicosRecord
                                .cuentasBancarias!
                                .toList();
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(bancos.length, (bancosIndex) {
                                final bancosItem = bancos[bancosIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 5),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        _model.bancoSeleccionado = bancosItem;
                                      });
                                      if (animationsMap[
                                              'columnOnActionTriggerAnimation1'] !=
                                          null) {
                                        animationsMap[
                                                'columnOnActionTriggerAnimation1']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                      if (animationsMap[
                                              'columnOnActionTriggerAnimation2'] !=
                                          null) {
                                        await animationsMap[
                                                'columnOnActionTriggerAnimation2']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 12, 16, 16),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Text(
                                                    bancosItem.banco!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF111417),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_right,
                                                color: Color(0xFF57636C),
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ).animateOnActionTrigger(
                  animationsMap['columnOnActionTriggerAnimation1']!,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 50, 16, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Ahora transfiere a estos datos.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.account_balance,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 34,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: InkWell(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: _model.bancoSeleccionado!.nombre!));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Nombre copiado.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.bancoSeleccionado
                                                      ?.nombre,
                                                  'Sin definir',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF111417),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.content_copy,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: InkWell(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: _model.bancoSeleccionado!.cedula!));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Cedula copiada.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.idCard,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.bancoSeleccionado
                                                      ?.cedula,
                                                  'Sin definir',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF111417),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.content_copy,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: InkWell(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: _model
                                          .bancoSeleccionado!.numeroCuenta!
                                          .toString()));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Numero de cuenta copiado.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons
                                                .account_balance_wallet_rounded,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.bancoSeleccionado
                                                      ?.numeroCuenta
                                                      ?.toString(),
                                                  'Sin definir',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF111417),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.content_copy,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: InkWell(
                                onTap: () async {
                                  await Clipboard.setData(ClipboardData(
                                      text: _model.bancoSeleccionado!.banco!));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Nombre del banco copiado.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.account_balance,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model
                                                      .bancoSeleccionado?.banco,
                                                  'Sin definir',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF111417),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.content_copy,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Total: ',
                              style: TextStyle(),
                            ),
                            TextSpan(
                              text: formatNumber(
                                widget.totalPagar,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: 'Bs. ',
                              ),
                              style: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Lexend',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cerrar',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'DM Sans',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Text(
                        '*Luego sube el comprobante',
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'DM Sans',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ],
                  ),
                ).animateOnActionTrigger(
                  animationsMap['columnOnActionTriggerAnimation2']!,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
