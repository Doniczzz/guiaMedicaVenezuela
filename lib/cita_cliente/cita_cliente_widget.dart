import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/cuentas_bancarias_widget.dart';
import '../components/pago_movil_widget.dart';
import '../components/trans_escoger_moneda_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'cita_cliente_model.dart';
export 'cita_cliente_model.dart';

class CitaClienteWidget extends StatefulWidget {
  const CitaClienteWidget({
    Key? key,
    this.medico,
    this.cita,
  }) : super(key: key);

  final DocumentReference? medico;
  final DocumentReference? cita;

  @override
  _CitaClienteWidgetState createState() => _CitaClienteWidgetState();
}

class _CitaClienteWidgetState extends State<CitaClienteWidget>
    with TickerProviderStateMixin {
  late CitaClienteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -500),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 300),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -500),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 300),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -500),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 300),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -500),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 300),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -500),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 300),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 300),
          end: Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CitaClienteModel());

    _model.nombreController ??= TextEditingController();
    _model.cedulaController ??= TextEditingController();
    _model.motivoCitaController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
      body: Stack(
        children: [
          StreamBuilder<MedicosRecord>(
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
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
                child: StreamBuilder<CitasRecord>(
                  stream: CitasRecord.getDocument(widget.cita!),
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
                    final pageViewCitasRecord = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 516.4,
                                    decoration: BoxDecoration(
                                      color: Color(0x86FFFFFF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                    child: Lottie.asset(
                                      'assets/lottie_animations/91338-medical-app.json',
                                      height: 100,
                                      fit: BoxFit.contain,
                                      animate: true,
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 20, 16, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '¿Para quien es la cita?',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  options: [
                                                    'Para mi',
                                                    'Otra persona'
                                                  ],
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .paraQuienCitaValue =
                                                        val);
                                                    setState(() {
                                                      _model.paraQuienCita =
                                                          _model
                                                              .paraQuienCitaValue;
                                                    });
                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  width: 180,
                                                  height: 50,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color: Colors.black,
                                                      ),
                                                  hintText:
                                                      'Selecciona una opción',
                                                  fillColor: Colors.white,
                                                  elevation: 2,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0,
                                                  borderRadius: 0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(12, 4, 12, 4),
                                                  hidesUnderline: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation1']!),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 516.4,
                                    decoration: BoxDecoration(
                                      color: Color(0x86FFFFFF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Lottie.asset(
                                              'assets/lottie_animations/2.json',
                                              height: 100,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                          Text(
                                            _model.paraQuienCita!,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .fondoMenu,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 15, 16, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        if (_model.paraQuienCitaValue !=
                                            'Para mi')
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    _model.paraQuienCita ==
                                                            'Para mi'
                                                        ? 'Ingresa tu nombre'
                                                        : 'Ingresa el nombre del paciente',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              TextFormField(
                                                controller:
                                                    _model.nombreController,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.nombreController',
                                                  Duration(milliseconds: 1000),
                                                  () => setState(() {}),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFDBE2E7),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              20, 20, 20, 20),
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF1D2429),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                minLines: 1,
                                                validator: _model
                                                    .nombreControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ],
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 15, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    _model.paraQuienCita ==
                                                            'Para mi'
                                                        ? 'Ingresa tu cedula'
                                                        : 'Ingresa la cedula del paciente',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              TextFormField(
                                                controller:
                                                    _model.cedulaController,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.cedulaController',
                                                  Duration(milliseconds: 1000),
                                                  () => setState(() {}),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFDBE2E7),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              20, 20, 20, 20),
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF1D2429),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                minLines: 1,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .cedulaControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp('[0-9]'))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.paraQuienCitaValue ==
                                            'Otra persona')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: !((_model.nombreController
                                                                  .text !=
                                                              null &&
                                                          _model.nombreController
                                                                  .text !=
                                                              '') &&
                                                      (_model.cedulaController
                                                                  .text !=
                                                              null &&
                                                          _model.cedulaController
                                                                  .text !=
                                                              ''))
                                                  ? null
                                                  : () async {
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                              text: 'Siguiente',
                                              icon: Icon(
                                                Icons.navigate_next,
                                                size: 15,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.white,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        if (_model.paraQuienCitaValue !=
                                            'Otra persona')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: _model.cedulaController
                                                              .text ==
                                                          null ||
                                                      _model.cedulaController
                                                              .text ==
                                                          ''
                                                  ? null
                                                  : () async {
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                              text: 'Siguiente',
                                              icon: Icon(
                                                Icons.navigate_next,
                                                size: 15,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.white,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation2']!),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 516.4,
                                    decoration: BoxDecoration(
                                      color: Color(0x86FFFFFF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Lottie.asset(
                                              'assets/lottie_animations/3.json',
                                              height: 100,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                          Text(
                                            _model.paraQuienCita!,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .fondoMenu,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation3']!),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 15, 16, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Motivo de la cita',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            TextFormField(
                                              controller:
                                                  _model.motivoCitaController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.motivoCitaController',
                                                Duration(milliseconds: 1000),
                                                () => setState(() {}),
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF57636C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0xFF57636C),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE2E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 20, 20, 20),
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF1D2429),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              maxLines: 5,
                                              minLines: 5,
                                              validator: _model
                                                  .motivoCitaControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: _model
                                                            .motivoCitaController
                                                            .text ==
                                                        null ||
                                                    _model.motivoCitaController
                                                            .text ==
                                                        ''
                                                ? null
                                                : () async {
                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                            text: 'Siguiente',
                                            icon: Icon(
                                              Icons.navigate_next,
                                              size: 15,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color: Colors.white,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation3']!),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 516.4,
                                    decoration: BoxDecoration(
                                      color: Color(0x86FFFFFF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Lottie.asset(
                                              'assets/lottie_animations/4.json',
                                              height: 100,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                          Text(
                                            '${pageViewCitasRecord.precio?.toString()} ${pageViewCitasRecord.tipoDeMoneda == 'Bolívares' ? 'Bs.' : 'US\$'}',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .fondoMenu,
                                                ),
                                          ),
                                          if (pageViewCitasRecord
                                                  .tipoDeMoneda ==
                                              'Ambos')
                                            FutureBuilder<ApiCallResponse>(
                                              future: CambioDolarCall.call(),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final textCambioDolarResponse =
                                                    snapshot.data!;
                                                return Text(
                                                  '(${formatNumber(
                                                    CambioDolarCall.precio(
                                                          textCambioDolarResponse
                                                              .jsonBody,
                                                        ) *
                                                        pageViewCitasRecord
                                                            .precio!,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                  )} Bs.)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            Color(0x9C001C2C),
                                                        fontSize: 16,
                                                      ),
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation4']!),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 25, 16, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 25),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Escoge tu método de pago.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title3
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (pageViewCitasRecord
                                                            .aceptaEfectivo ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    15, 0),
                                                        child: StreamBuilder<
                                                            UsersRecord>(
                                                          stream: UsersRecord
                                                              .getDocument(
                                                                  containerMedicosRecord
                                                                      .parentReference),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final buttonUsersRecord =
                                                                snapshot.data!;
                                                            return FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                setState(() {
                                                                  _model.nReferencia =
                                                                      random_data
                                                                          .randomString(
                                                                    6,
                                                                    6,
                                                                    false,
                                                                    false,
                                                                    true,
                                                                  );
                                                                });

                                                                final citasUpdateData =
                                                                    {
                                                                  'pacientes':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getPacientesFirestoreData(
                                                                      createPacientesStruct(
                                                                        paciente:
                                                                            currentUserReference,
                                                                        metodoPago:
                                                                            'Efectivo',
                                                                        numeroReferencia:
                                                                            _model.nReferencia,
                                                                        status:
                                                                            2,
                                                                        cedula: int.tryParse(_model
                                                                            .cedulaController
                                                                            .text),
                                                                        motivoCita: _model
                                                                            .motivoCitaController
                                                                            .text,
                                                                        nombrePaciente: _model.paraQuienCitaValue ==
                                                                                'Para mi'
                                                                            ? currentUserDisplayName
                                                                            : _model.nombreController.text,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                };
                                                                await pageViewCitasRecord
                                                                    .reference
                                                                    .update(
                                                                        citasUpdateData);
                                                                if (buttonUsersRecord
                                                                    .pushNotification!) {
                                                                  triggerPushNotification(
                                                                    notificationTitle:
                                                                        'Tienes un nuevo paciente.',
                                                                    notificationText:
                                                                        'Un paciente ha agendado una cita con efectivo.',
                                                                    notificationSound:
                                                                        'default',
                                                                    userRefs: [
                                                                      buttonUsersRecord
                                                                          .reference
                                                                    ],
                                                                    initialPageName:
                                                                        'home',
                                                                    parameterData: {},
                                                                  );
                                                                }

                                                                context.goNamed(
                                                                  'sucess',
                                                                  queryParams: {
                                                                    'numeroPaciente':
                                                                        serializeParam(
                                                                      pageViewCitasRecord
                                                                              .pacientes!
                                                                              .toList()
                                                                              .length +
                                                                          1,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                    'especialidad':
                                                                        serializeParam(
                                                                      pageViewCitasRecord
                                                                          .especialidad,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'medicoNombre':
                                                                        serializeParam(
                                                                      containerMedicosRecord
                                                                          .nombre,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'nReferencia':
                                                                        serializeParam(
                                                                      _model
                                                                          .nReferencia,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'status':
                                                                        serializeParam(
                                                                      2,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              text: 'Efectivo',
                                                              icon: FaIcon(
                                                                FontAwesomeIcons
                                                                    .moneyBillWave,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130,
                                                                height: 40,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .fondoMenu,
                                                                    ),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            setState(() {
                                                              _model.metodoPago =
                                                                  'Transferencia';
                                                            });
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              isDismissible:
                                                                  false,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      TransEscogerMonedaWidget(
                                                                    moneda1:
                                                                        pageViewCitasRecord
                                                                            .moneda,
                                                                    moneda2:
                                                                        pageViewCitasRecord
                                                                            .moneda2,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(() =>
                                                                    _model.text =
                                                                        value));

                                                            if (_model.text ==
                                                                'Dólares') {
                                                              setState(() {
                                                                _model.tipoTransferencia =
                                                                    'Zelle';
                                                              });
                                                            }
                                                            await _model
                                                                .pageViewController
                                                                ?.nextPage(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                              curve:
                                                                  Curves.ease,
                                                            );

                                                            setState(() {});
                                                          },
                                                          text: 'Transferencia',
                                                          icon: Icon(
                                                            Icons
                                                                .compare_arrows,
                                                            size: 15,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .fondoMenu,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation4']!),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 516.4,
                                    decoration: BoxDecoration(
                                      color: Color(0x86FFFFFF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Lottie.asset(
                                              'assets/lottie_animations/5.json',
                                              height: 100,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Pago seleccionado: ',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    _model.text,
                                                    '0',
                                                  ),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .fondoMenu,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  containerMedicosRecord
                                                      .parentReference),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final buttonUsersRecord =
                                                    snapshot.data!;
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      setState(() => _model
                                                              .isMediaUploading =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        selectedUploadedFiles =
                                                            selectedMedia
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                      height: m
                                                                          .dimensions
                                                                          ?.height,
                                                                      width: m
                                                                          .dimensions
                                                                          ?.width,
                                                                    ))
                                                                .toList();

                                                        downloadUrls =
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        _model.isMediaUploading =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        setState(() {
                                                          _model.uploadedLocalFile =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        setState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_model.uploadedFileUrl !=
                                                            null &&
                                                        _model.uploadedFileUrl !=
                                                            '') {
                                                      setState(() {
                                                        _model.nReferencia =
                                                            random_data
                                                                .randomString(
                                                          6,
                                                          6,
                                                          false,
                                                          false,
                                                          true,
                                                        );
                                                      });

                                                      final citasUpdateData = {
                                                        'pacientes': FieldValue
                                                            .arrayUnion([
                                                          getPacientesFirestoreData(
                                                            createPacientesStruct(
                                                              paciente:
                                                                  currentUserReference,
                                                              metodoPago: _model
                                                                  .metodoPago,
                                                              numeroReferencia:
                                                                  _model
                                                                      .nReferencia,
                                                              comprobante: _model
                                                                  .uploadedFileUrl,
                                                              status: 1,
                                                              cedula: int
                                                                  .tryParse(_model
                                                                      .cedulaController
                                                                      .text),
                                                              motivoCita: _model
                                                                  .motivoCitaController
                                                                  .text,
                                                              tipoTransferencia:
                                                                  _model
                                                                      .tipoTransferencia,
                                                              nombrePaciente: _model
                                                                          .paraQuienCitaValue ==
                                                                      'Para mi'
                                                                  ? currentUserDisplayName
                                                                  : _model
                                                                      .nombreController
                                                                      .text,
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                            true,
                                                          )
                                                        ]),
                                                      };
                                                      await widget.cita!.update(
                                                          citasUpdateData);

                                                      context.goNamed(
                                                        'sucess',
                                                        queryParams: {
                                                          'numeroPaciente':
                                                              serializeParam(
                                                            pageViewCitasRecord
                                                                    .pacientes!
                                                                    .toList()
                                                                    .length +
                                                                1,
                                                            ParamType.int,
                                                          ),
                                                          'especialidad':
                                                              serializeParam(
                                                            pageViewCitasRecord
                                                                .especialidad,
                                                            ParamType.String,
                                                          ),
                                                          'medicoNombre':
                                                              serializeParam(
                                                            containerMedicosRecord
                                                                .nombre,
                                                            ParamType.String,
                                                          ),
                                                          'nReferencia':
                                                              serializeParam(
                                                            _model.nReferencia,
                                                            ParamType.String,
                                                          ),
                                                          'status':
                                                              serializeParam(
                                                            1,
                                                            ParamType.int,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('¡Error!'),
                                                            content: Text(
                                                                'No has subido ninguna imagen.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    if (buttonUsersRecord
                                                        .pushNotification!) {
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            'Un nuevo paciente ha agendado una cita',
                                                        notificationText:
                                                            'Un paciente ha hecho un pago, por favor revisa el comprobante.',
                                                        notificationSound:
                                                            'default',
                                                        userRefs: [
                                                          buttonUsersRecord
                                                              .reference
                                                        ],
                                                        initialPageName:
                                                            'pacientes',
                                                        parameterData: {
                                                          'cita': widget.cita,
                                                        },
                                                      );
                                                    }
                                                  },
                                                  text: 'Subir comprobante',
                                                  icon: Icon(
                                                    Icons.cloud_upload,
                                                    size: 15,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: Colors.white,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation5']!),
                                  Stack(
                                    children: [
                                      if (_model.text == 'Bolívares')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 25, 16, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Selecciona algún método para transferir',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future:
                                                      CambioDolarCall.call(),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final columnCambioDolarResponse =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (containerMedicosRecord
                                                                .pagosMovil!
                                                                .toList()
                                                                .length >
                                                            0)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        5),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  isDismissible:
                                                                      false,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          PagoMovilWidget(
                                                                        medico:
                                                                            containerMedicosRecord.reference,
                                                                        totalPagar:
                                                                            valueOrDefault<double>(
                                                                          pageViewCitasRecord.tipoDeMoneda == 'Bolívares'
                                                                              ? pageViewCitasRecord.precio
                                                                              : (CambioDolarCall.precio(
                                                                                    columnCambioDolarResponse.jsonBody,
                                                                                  ) *
                                                                                  pageViewCitasRecord.precio!),
                                                                          0.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));

                                                                setState(() {
                                                                  _model.tipoTransferencia =
                                                                      'Pago movil';
                                                                });
                                                              },
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 2,
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16,
                                                                            12,
                                                                            16,
                                                                            16),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'Pago Móvil',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle1
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                color: Color(0xFF111417),
                                                                                fontSize: 18,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .chevron_right_rounded,
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          size:
                                                                              24,
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
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      5, 0, 1),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                isDismissible:
                                                                    false,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(
                                                                            context)
                                                                        .viewInsets,
                                                                    child:
                                                                        CuentasBancariasWidget(
                                                                      medico: widget
                                                                          .medico,
                                                                      totalPagar:
                                                                          valueOrDefault<
                                                                              double>(
                                                                        pageViewCitasRecord.tipoDeMoneda ==
                                                                                'Bolívares'
                                                                            ? pageViewCitasRecord.precio
                                                                            : (CambioDolarCall.precio(
                                                                                  columnCambioDolarResponse.jsonBody,
                                                                                ) *
                                                                                pageViewCitasRecord.precio!),
                                                                        0.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              setState(() {
                                                                _model.tipoTransferencia =
                                                                    'Transferencia bancaria';
                                                              });
                                                            },
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 2,
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          12,
                                                                          16,
                                                                          16),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Transferencia Bancaria',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0xFF111417),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                      Icon(
                                                                        Icons
                                                                            .chevron_right_rounded,
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation5']!),
                                        ),
                                      if (_model.text == 'Dólares')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 16, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 16, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Haz la transferencia a esta cuenta de Zelle',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title3
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 0, 5),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/zelle-logo-5.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await Clipboard.setData(
                                                              ClipboardData(
                                                                  text: containerMedicosRecord
                                                                      .cuentaZelle
                                                                      .correo!));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Email Copiado',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                            ),
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2,
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          12,
                                                                          16,
                                                                          16),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .email_outlined,
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    size: 24,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        containerMedicosRecord
                                                                            .cuentaZelle
                                                                            .correo!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0xFF111417),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .content_copy,
                                                                    color: Color(
                                                                        0xFF57636C),
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 1),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await Clipboard.setData(
                                                              ClipboardData(
                                                                  text: containerMedicosRecord
                                                                      .cuentaZelle
                                                                      .nombre!));
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Nombre Copiado',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                            ),
                                                          );
                                                        },
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 2,
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          12,
                                                                          16,
                                                                          16),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .person,
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    size: 24,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        containerMedicosRecord
                                                                            .cuentaZelle
                                                                            .nombre!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: Color(0xFF111417),
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .content_copy,
                                                                    color: Color(
                                                                        0xFF57636C),
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
                                            ],
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation6']!),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () async {
                    context.goNamed('home');
                  },
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
