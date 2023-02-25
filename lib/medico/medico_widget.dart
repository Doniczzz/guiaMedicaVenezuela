import '../auth/auth_util.dart';
import '../backend/backend.dart';
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
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medico_model.dart';
export 'medico_model.dart';

class MedicoWidget extends StatefulWidget {
  const MedicoWidget({
    Key? key,
    this.medico,
  }) : super(key: key);

  final DocumentReference? medico;

  @override
  _MedicoWidgetState createState() => _MedicoWidgetState();
}

class _MedicoWidgetState extends State<MedicoWidget>
    with TickerProviderStateMixin {
  late MedicoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, -450),
          end: Offset(0, 0),
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
          begin: Offset(0, 0),
          end: Offset(0, -500),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 400),
          end: Offset(0, 0),
        ),
      ],
    ),
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, 500),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedicoModel());

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
        final medicoMedicosRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Container(
                    height: 450,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                medicoMedicosRecord.parentReference),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final imageUsersRecord = snapshot.data!;
                              return Image.network(
                                valueOrDefault<String>(
                                  imageUsersRecord.photoUrl,
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/xij2t4ymf6c9/isotipo2.png',
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                fit: BoxFit.contain,
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.93, -0.95),
                          child: Icon(
                            Icons.bookmark_border_outlined,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            size: 40,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.96, -0.97),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            buttonSize: 48,
                            icon: Icon(
                              Icons.close,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 40,
                            ),
                            onPressed: () async {
                              context.pushNamed('home');
                            },
                          ),
                        ),
                        if (medicoMedicosRecord.ratings!.toList().length > 0)
                          Align(
                            alignment: AlignmentDirectional(0, 0.95),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Container(
                                width: 173,
                                height: 56.4,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).gray200,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Rating',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'DM Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                            ),
                                      ),
                                      Expanded(
                                        child: RatingBarIndicator(
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                          ),
                                          direction: Axis.horizontal,
                                          rating: valueOrDefault<double>(
                                            functions.sumaRatings(
                                                    medicoMedicosRecord.ratings!
                                                        .toList()) /
                                                medicoMedicosRecord.ratings!
                                                    .toList()
                                                    .length
                                                    .toDouble(),
                                            0.0,
                                          ),
                                          unratedColor: Color(0xFF9E9E9E),
                                          itemCount: 5,
                                          itemSize: 25,
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
                ),
              )
                  .animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!)
                  .animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation']!,
                  ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    medicoMedicosRecord.nombre!,
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: Color(0xF2F2F2F2),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 50),
                                    child: Text(
                                      functions.listaToString(
                                          medicoMedicosRecord.especialidades!
                                              .toList()),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0x95DBE2E7),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Selecciona una cita',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (medicoMedicosRecord.citasCreadas!.toList().length >
                            0)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                            child: StreamBuilder<List<CitasRecord>>(
                              stream: queryCitasRecord(
                                queryBuilder: (citasRecord) => citasRecord
                                    .where('medico', isEqualTo: widget.medico)
                                    .where('fecha',
                                        isGreaterThan: getCurrentTimestamp)
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<CitasRecord> rowCitasRecordList =
                                    snapshot.data!;
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        rowCitasRecordList.length, (rowIndex) {
                                      final rowCitasRecord =
                                          rowCitasRecordList[rowIndex];
                                      return Visibility(
                                        visible: !functions.pacienteEnCita(
                                                currentUserReference,
                                                rowCitasRecord.pacientes!
                                                    .toList())! &&
                                            (rowCitasRecord.pacientes!
                                                    .toList()
                                                    .length <
                                                rowCitasRecord.maxCitas!),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 15, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }
                                              if (animationsMap[
                                                      'columnOnActionTriggerAnimation'] !=
                                                  null) {
                                                await animationsMap[
                                                        'columnOnActionTriggerAnimation']!
                                                    .controller
                                                    .forward(from: 0.0);
                                              }

                                              context.pushNamed(
                                                'citaCliente',
                                                queryParams: {
                                                  'medico': serializeParam(
                                                    widget.medico,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'cita': serializeParam(
                                                    rowCitasRecord.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: 302.9,
                                              height: 107.4,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                border: Border.all(
                                                  color: Color(0xF2EAEAEA),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 15, 15, 15),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .attach_money_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .fondoMenu,
                                                          size: 34,
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${rowCitasRecord.precio?.toString()}${rowCitasRecord.tipoDeMoneda == 'Bolívares' ? ' Bs.' : ' US\$'}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .fondoMenu,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                ),
                                                                if (rowCitasRecord
                                                                        .tipoDeMoneda ==
                                                                    'Ambos')
                                                                  Text(
                                                                    'Se aceptan Bolívares',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        if (rowCitasRecord
                                                                .aceptaEfectivo ??
                                                            true)
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Efectivo',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'DM Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .fondoMenu,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              Icon(
                                                                Icons.check_box,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 24,
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 1),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xF2E2E2E2),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    16),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    16),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      0, 12, 4),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .calendar_today,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                size: 20,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '${functions.retornarDia(rowCitasRecord.fecha!)}, ${dateTimeFormat(
                                                                    'd/M',
                                                                    rowCitasRecord
                                                                        .fecha,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Icon(
                                                                  Icons.timer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                    'jm',
                                                                    rowCitasRecord
                                                                        .fecha!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            25,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_right,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                  size: 24,
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
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        if (medicoMedicosRecord.citasCreadas!.toList().length ==
                            0)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 25, 0, 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'No hay citas disponibles, intentelo mas tarde.',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 15),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Contacto',
                                icon: Icon(
                                  Icons.email_outlined,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  height: 40,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
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
                  )
                      .animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!)
                      .animateOnActionTrigger(
                        animationsMap['columnOnActionTriggerAnimation']!,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
