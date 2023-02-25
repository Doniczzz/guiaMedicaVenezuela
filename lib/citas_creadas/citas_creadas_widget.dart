import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/borrar_cita_widget.dart';
import '../components/editar_cita_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'citas_creadas_model.dart';
export 'citas_creadas_model.dart';

class CitasCreadasWidget extends StatefulWidget {
  const CitasCreadasWidget({
    Key? key,
    this.medico,
  }) : super(key: key);

  final DocumentReference? medico;

  @override
  _CitasCreadasWidgetState createState() => _CitasCreadasWidgetState();
}

class _CitasCreadasWidgetState extends State<CitasCreadasWidget>
    with TickerProviderStateMixin {
  late CitasCreadasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'columnOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, 900),
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
          begin: Offset(0, 800),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CitasCreadasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.citaSeleccionada != null) {
        setState(() {
          _model.citaSeleccionada = _model.citaSeleccionada;
        });
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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

    return StreamBuilder<List<CitasRecord>>(
      stream: queryCitasRecord(
        queryBuilder: (citasRecord) => citasRecord
            .where('medico', isEqualTo: widget.medico)
            .where('fecha', isGreaterThan: getCurrentTimestamp)
            .orderBy('fecha'),
      ),
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
        List<CitasRecord> citasCreadasCitasRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF2F2F2),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Stack(
                children: [
                  if (citasCreadasCitasRecordList.length > 0)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 243.7,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).fondoMenu,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .gray200,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        context.pop();
                                      },
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'citasCaducadas',
                                          queryParams: {
                                            'medico': serializeParam(
                                              widget.medico,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: 'Citas Caducadas',
                                      options: FFButtonOptions(
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 20, 10, 0),
                                child: Builder(
                                  builder: (context) {
                                    final citas =
                                        citasCreadasCitasRecordList.toList();
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(citas.length,
                                            (citasIndex) {
                                          final citasItem = citas[citasIndex];
                                          return Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 0, 10, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    setState(() {
                                                      _model.citaSeleccionada =
                                                          citasItem;
                                                    });
                                                    if (animationsMap[
                                                            'columnOnActionTriggerAnimation1'] !=
                                                        null) {
                                                      await animationsMap[
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
                                                  child: Container(
                                                    width: 129.7,
                                                    height: 144.1,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gray200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          functions.retornarDia(
                                                              citasItem.fecha!),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                        Text(
                                                          functions
                                                              .numeroDia(
                                                                  citasItem
                                                                      .fecha)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                fontSize: 54,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions
                                                                .retornarMes(
                                                                    citasItem
                                                                        .fecha),
                                                            'Mes no definido',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.citaSeleccionada !=
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(30, 0, 10, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      if (animationsMap[
                                                              'columnOnActionTriggerAnimation3'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'columnOnActionTriggerAnimation3']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                      setState(() {
                                                        _model.citaSeleccionada =
                                                            citasItem;
                                                      });
                                                      if (animationsMap[
                                                              'columnOnActionTriggerAnimation3'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'columnOnActionTriggerAnimation3']!
                                                            .controller
                                                            .forward()
                                                            .whenComplete(
                                                                animationsMap[
                                                                        'columnOnActionTriggerAnimation3']!
                                                                    .controller
                                                                    .reverse);
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 129.7,
                                                      height: 144.1,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        border: Border.all(
                                                          color: citasItem
                                                                      .reference ==
                                                                  _model
                                                                      .citaSeleccionada!
                                                                      .reference
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryColor
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .gray200,
                                                          width: 4,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 20, 16, 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Lottie.asset(
                                            'assets/lottie_animations/127049-calendar-lottie-animation.json',
                                            width: 400,
                                            height: 400,
                                            fit: BoxFit.contain,
                                            animate: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Selecciona una fecha',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Lexend',
                                            fontSize: 30,
                                          ),
                                    ),
                                  ],
                                )
                                    .animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation']!)
                                    .animateOnActionTrigger(
                                      animationsMap[
                                          'columnOnActionTriggerAnimation1']!,
                                    ),
                              ),
                              if (_model.citaSeleccionada != null)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 25, 16, 10),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Información',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray600,
                                                      ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 60,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.edit,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    size: 35,
                                                  ),
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              EditarCitaWidget(
                                                            cita: _model
                                                                .citaSeleccionada!
                                                                .reference,
                                                            medico:
                                                                widget.medico,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${functions.retornarDia(_model.citaSeleccionada!.fecha!)}, ${dateTimeFormat(
                                                    'd/M',
                                                    _model.citaSeleccionada!
                                                        .fecha,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .fondoMenu,
                                                        fontSize: 22,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 4,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray200,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20,
                                                                      20,
                                                                      20,
                                                                      20),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Tipo de pago',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: Color(
                                                                          0xBA262D34),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  _model
                                                                      .citaSeleccionada!
                                                                      .tipoDeMoneda!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .fondoMenu,
                                                                      ),
                                                                ),
                                                              ),
                                                              if (_model
                                                                      .citaSeleccionada!
                                                                      .tipoDeMoneda ==
                                                                  'Ambos')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Dólares y Bolívares',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2,
                                                                  ),
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'Efectivo',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2,
                                                                    ),
                                                                    if (_model
                                                                            .citaSeleccionada!
                                                                            .aceptaEfectivo ??
                                                                        true)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check_box,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      ),
                                                                    if (!_model
                                                                        .citaSeleccionada!
                                                                        .aceptaEfectivo!)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check_box_outline_blank,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryColor,
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 4,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray200,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20,
                                                                      20,
                                                                      20,
                                                                      20),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Precio por paciente',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: Color(
                                                                          0xBA262D34),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '${_model.citaSeleccionada!.precio?.toString()} ${() {
                                                                    if (_model
                                                                            .citaSeleccionada!
                                                                            .tipoDeMoneda ==
                                                                        'Bolívares') {
                                                                      return 'Bs.';
                                                                    } else if (_model
                                                                            .citaSeleccionada!
                                                                            .tipoDeMoneda ==
                                                                        'Dólares') {
                                                                      return 'US\$';
                                                                    } else {
                                                                      return 'US\$';
                                                                    }
                                                                  }()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .fondoMenu,
                                                                      ),
                                                                ),
                                                              ),
                                                              if (_model
                                                                      .citaSeleccionada!
                                                                      .tipoDeMoneda ==
                                                                  'Ambos')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0),
                                                                  child: FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future: CambioDolarCall
                                                                        .call(),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final textCambioDolarResponse =
                                                                          snapshot
                                                                              .data!;
                                                                      return Text(
                                                                        '${formatNumber(
                                                                          _model.citaSeleccionada!.precio! *
                                                                              CambioDolarCall.precio(
                                                                                textCambioDolarResponse.jsonBody,
                                                                              ),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.automatic,
                                                                        )} Bs.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: 'Lexend',
                                                                              color: FlutterFlowTheme.of(context).gray600,
                                                                            ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 4,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray200,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20,
                                                                      20,
                                                                      20,
                                                                      20),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Especialidad',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: Color(
                                                                          0xBA262D34),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  _model
                                                                      .citaSeleccionada!
                                                                      .especialidad!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .fondoMenu,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 4,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .gray200,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20,
                                                                      20,
                                                                      20,
                                                                      20),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Pacientes',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: Color(
                                                                          0xBA262D34),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
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
                                                                                'Dólares',
                                                                            numeroReferencia:
                                                                                '2342423423',
                                                                            comprobante:
                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/inacqqunop3h/isotipo.png',
                                                                            status:
                                                                                1,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    };
                                                                    await _model
                                                                        .citaSeleccionada!
                                                                        .reference
                                                                        .update(
                                                                            citasUpdateData);
                                                                  },
                                                                  child: Text(
                                                                    '${_model.citaSeleccionada!.pacientes!.toList().length.toString()} de ${_model.citaSeleccionada!.maxCitas?.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .title2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).fondoMenu,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'pacientes',
                                                                      queryParams:
                                                                          {
                                                                        'cita':
                                                                            serializeParam(
                                                                          _model
                                                                              .citaSeleccionada,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        'cita':
                                                                            _model.citaSeleccionada,
                                                                      },
                                                                    );
                                                                  },
                                                                  text:
                                                                      'Ver todos',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_right,
                                                                    size: 15,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height: 40,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'DM Sans',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 25, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                BorrarCitaWidget(
                                                              cita: _model
                                                                  .citaSeleccionada!
                                                                  .reference,
                                                              medico:
                                                                  widget.medico,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: 'Borrar',
                                                    icon: Icon(
                                                      Icons.warning,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 130,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'columnOnActionTriggerAnimation3']!,
                                        ),
                                      ],
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'columnOnActionTriggerAnimation2']!,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (citasCreadasCitasRecordList.length == 0)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Lottie.asset(
                                    'assets/lottie_animations/98121-empty-state.json',
                                    width: 400,
                                    height: 400,
                                    fit: BoxFit.contain,
                                    animate: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                            child: Text(
                              'No has creado ninguna cita',
                              textAlign: TextAlign.center,
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Lexend',
                                        fontSize: 25,
                                      ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('home');
                            },
                            text: 'Volver',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
