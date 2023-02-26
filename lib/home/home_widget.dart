import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/buscar_codigo_widget.dart';
import '../components/cita_widget.dart';
import '../components/enviar_soporte_widget.dart';
import '../components/loading_widget.dart';
import '../components/mindscode_logo_widget.dart';
import '../components/mis_citas_comp_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
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
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: Offset(0, 0),
          end: Offset(350, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 1,
          end: 0.7,
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: Offset(0, 0),
          end: Offset(0, 0.349),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: LoadingWidget(),
          );
        },
      ).then((value) => setState(() {}));

      if (!valueOrDefault<bool>(currentUserDocument?.registro, false)) {
        context.pushNamed(
          'registro',
          queryParams: {
            'tieneEstado': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
        );

        Navigator.pop(context);
        return;
      }
      await Future.delayed(const Duration(milliseconds: 3000));
      Navigator.pop(context);
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CitasRecord>>(
      stream: queryCitasRecord(),
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
        List<CitasRecord> homeCitasRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          floatingActionButton: StreamBuilder<List<MedicosRecord>>(
            stream: queryMedicosRecord(
              parent: currentUserReference,
              singleRecord: true,
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
              List<MedicosRecord> floatingActionButtonMedicosRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final floatingActionButtonMedicosRecord =
                  floatingActionButtonMedicosRecordList.isNotEmpty
                      ? floatingActionButtonMedicosRecordList.first
                      : null;
              return FloatingActionButton(
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: BuscarCodigoWidget(),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
                elevation: 8,
                child: Icon(
                  Icons.qr_code,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  size: 30,
                ),
              );
            },
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF0B161D),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 105, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 40, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: 80,
                                  height: 80,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/inacqqunop3h/isotipo.png',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray200,
                                              fontSize: 25,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      currentUserEmail,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            fontSize: 14,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if ((currentPhoneNumber == null ||
                                currentPhoneNumber == '') &&
                            (currentUserPhoto == null ||
                                currentUserPhoto == ''))
                          AuthUserStreamWidget(
                            builder: (context) => Text(
                              'Te faltan datos en tu cuenta.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFFF6848B),
                                  ),
                            ),
                          ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 40, 10, 0),
                          child: InkWell(
                            onTap: () async {
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation2'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation2']!
                                    .controller
                                    .forward()
                                    .whenComplete(animationsMap[
                                            'containerOnActionTriggerAnimation2']!
                                        .controller
                                        .reverse);
                              }
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation1'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation1']!
                                    .controller
                                    .forward()
                                    .whenComplete(animationsMap[
                                            'containerOnActionTriggerAnimation1']!
                                        .controller
                                        .reverse);
                              }
                              if (animationsMap[
                                      'containerOnActionTriggerAnimation3'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation3']!
                                    .controller
                                    .forward()
                                    .whenComplete(animationsMap[
                                            'containerOnActionTriggerAnimation3']!
                                        .controller
                                        .reverse);
                              }
                              setState(() {
                                _model.menuAbierto = false;
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Menú',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .gray200,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .forward()
                                          .whenComplete(animationsMap[
                                                  'containerOnActionTriggerAnimation2']!
                                              .controller
                                              .reverse);
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation1'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .forward()
                                          .whenComplete(animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .reverse);
                                    }
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation3'] !=
                                        null) {
                                      animationsMap[
                                              'containerOnActionTriggerAnimation3']!
                                          .controller
                                          .forward()
                                          .whenComplete(animationsMap[
                                                  'containerOnActionTriggerAnimation3']!
                                              .controller
                                              .reverse);
                                    }
                                    setState(() {
                                      _model.menuAbierto = false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                          child: StreamBuilder<List<MedicosRecord>>(
                            stream: queryMedicosRecord(
                              parent: currentUserReference,
                              singleRecord: true,
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
                              List<MedicosRecord> columnMedicosRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnMedicosRecord =
                                  columnMedicosRecordList.isNotEmpty
                                      ? columnMedicosRecordList.first
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 18, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'crearCita',
                                          queryParams: {
                                            'medico': serializeParam(
                                              columnMedicosRecord!.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF375D77),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .solidCalendarPlus,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(18, 0, 0, 0),
                                                child: Text(
                                                  'Crear citas',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 18, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'citasCreadas',
                                          queryParams: {
                                            'medico': serializeParam(
                                              columnMedicosRecord!.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF375D77),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.history,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(18, 0, 0, 0),
                                                  child: Text(
                                                    'Citas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 20,
                                                        ),
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
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault<bool>(
                                  currentUserDocument?.habilitado, false))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 18, 0, 0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      onTap: () async {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: LoadingWidget(),
                                            );
                                          },
                                        ).then((value) => setState(() {}));

                                        await Future.delayed(
                                            const Duration(milliseconds: 2000));

                                        final medicosCreateData =
                                            createMedicosRecordData(
                                          rating: 0.0,
                                          ubicacion: createDondeViveStruct(
                                            estado: currentUserDocument!
                                                .dondeVive.estado,
                                            ciudad: currentUserDocument!
                                                .dondeVive.ciudad,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          nombre: currentUserDisplayName,
                                        );
                                        var medicosRecordReference =
                                            MedicosRecord.createDoc(
                                                currentUserReference!);
                                        await medicosRecordReference
                                            .set(medicosCreateData);
                                        _model.med =
                                            MedicosRecord.getDocumentFromData(
                                                medicosCreateData,
                                                medicosRecordReference);

                                        final ciudadesUpdateData = {
                                          'medicos': FieldValue.arrayUnion(
                                              [_model.med!.reference]),
                                        };
                                        await currentUserDocument!
                                            .dondeVive.ciudad!
                                            .update(ciudadesUpdateData);

                                        context.pushNamed(
                                          'crearMedico',
                                          queryParams: {
                                            'medico': serializeParam(
                                              _model.med,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'medico': _model.med,
                                          },
                                        );

                                        Navigator.pop(context);

                                        setState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF375D77),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.userMd,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24,
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(18, 0, 0, 0),
                                                  child: Text(
                                                    'Llenar Datos',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 20,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 18, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    context.pushNamed('miCuenta');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF273640),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: Icon(
                                              Icons.location_history,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18, 0, 0, 0),
                                            child: Text(
                                              'Mi perfil',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 18, 0, 0),
                                child: FutureBuilder<List<SoporteRecord>>(
                                  future: querySoporteRecordOnce(
                                    queryBuilder: (soporteRecord) =>
                                        soporteRecord.where('usuario',
                                            isEqualTo: currentUserReference),
                                    singleRecord: true,
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
                                    List<SoporteRecord>
                                        containerSoporteRecordList =
                                        snapshot.data!;
                                    final containerSoporteRecord =
                                        containerSoporteRecordList.isNotEmpty
                                            ? containerSoporteRecordList.first
                                            : null;
                                    return InkWell(
                                      onTap: () async {
                                        if (containerSoporteRecord != null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title:
                                                    Text('¡No te preocupes!'),
                                                content: Text(
                                                    'Tu solicitud está siendo revisada por los administradores.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: EnviarSoporteWidget(),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF273640),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 0, 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.wrench,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(18, 0, 0, 0),
                                                child: Text(
                                                  'Soporte',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: wrapWithModel(
                                    model: _model.mindscodeLogoModel,
                                    updateCallback: () => setState(() {}),
                                    child: MindscodeLogoWidget(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animateOnActionTrigger(
                  animationsMap['containerOnActionTriggerAnimation1']!,
                ),
                AuthUserStreamWidget(
                  builder: (context) => StreamBuilder<CiudadesRecord>(
                    stream: CiudadesRecord.getDocument(
                        currentUserDocument!.dondeVive.ciudad!),
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
                      final inicioCiudadesRecord = snapshot.data!;
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 8, 20, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation2'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation2']!
                                              .controller
                                              .forward();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation1'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation1']!
                                              .controller
                                              .forward();
                                        }
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation3'] !=
                                            null) {
                                          animationsMap[
                                                  'containerOnActionTriggerAnimation3']!
                                              .controller
                                              .forward();
                                        }
                                        setState(() {
                                          _model.menuAbierto = true;
                                        });
                                      },
                                      child: Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Color(0xF2F2F2F2),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 10),
                                          child: Image.asset(
                                            'assets/images/menu.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'containerOnActionTriggerAnimation3']!,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        context.pushNamed('notificaciones');
                                      },
                                      child: Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Color(0xF2F2F2F2),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 10),
                                              child: Image.asset(
                                                'assets/images/bell.png',
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, -1),
                                              child: Container(
                                                width: 22,
                                                height: 22,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      (currentUserDocument
                                                                  ?.notificaciones
                                                                  ?.toList() ??
                                                              [])
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            functions
                                                .saludo(getCurrentTimestamp),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .title2
                                              .override(
                                                fontFamily: 'Lexend',
                                                color: Color(0xFF001C2C),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: StreamBuilder<
                                          List<PublicidadesRecord>>(
                                        stream: queryPublicidadesRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
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
                                          List<PublicidadesRecord>
                                              containerPublicidadesRecordList =
                                              snapshot.data!;
                                          return Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Visibility(
                                              visible:
                                                  containerPublicidadesRecordList
                                                          .length >
                                                      0,
                                              child: Container(
                                                width: double.infinity,
                                                height: 250,
                                                child: custom_widgets.Test(
                                                  width: double.infinity,
                                                  height: 250,
                                                  imgLista: functions
                                                      .listaImagenes(
                                                          containerPublicidadesRecordList
                                                              .toList())!
                                                      .toList(),
                                                  publicidadesRecord:
                                                      containerPublicidadesRecordList
                                                          .toList(),
                                                  titulo: functions
                                                      .listaTitulos(
                                                          containerPublicidadesRecordList
                                                              .toList())!
                                                      .toList(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 20, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          context.pushNamed('estados');
                                        },
                                        child: Container(
                                          width: 114.5,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Color(0x2B39D2C0),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 16, 16, 16),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Image.asset(
                                                  'assets/images/vecteezy_glossy-button-circle-shaped-illustration-of-venezuela-flag_16872690-[Convertido].png',
                                                  width: 25,
                                                  height: 25,
                                                  fit: BoxFit.contain,
                                                ),
                                                Text(
                                                  'Buscar Estado',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        context
                                            .pushNamed('buscarEspecialidades');
                                      },
                                      child: Container(
                                        width: 181.1,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Color(0x600063A8),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 16, 16, 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                'assets/images/Health_Insurance.png',
                                                width: 30,
                                                height: 30,
                                                fit: BoxFit.contain,
                                              ),
                                              Text(
                                                'Especialidades',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (functions.filtroCitas(currentUserReference,
                                      homeCitasRecordList.toList()) ??
                                  true)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 20, 16, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Mis próximas citas',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: Color(0xFF001C2C),
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              context.pushNamed('misCitas');
                                            },
                                            child: Text(
                                              'Ver todas',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'DM Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 16, 20, 0),
                                      child: StreamBuilder<CitasRecord>(
                                        stream: CitasRecord.getDocument(
                                            functions.citaMasCercana(
                                                homeCitasRecordList.toList(),
                                                getCurrentTimestamp,
                                                currentUserReference)!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
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
                                          final misCitasCompCitasRecord =
                                              snapshot.data!;
                                          return InkWell(
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: CitaWidget(
                                                      cita: functions.citaMasCercana(
                                                          homeCitasRecordList
                                                              .toList(),
                                                          getCurrentTimestamp,
                                                          currentUserReference),
                                                      paciente: functions
                                                          .retornarPaciente(
                                                              currentUserReference,
                                                              misCitasCompCitasRecord),
                                                      numeroPaciente:
                                                          functions.nPaciente(
                                                              currentUserReference,
                                                              misCitasCompCitasRecord),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: wrapWithModel(
                                              model: _model.misCitasCompModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: MisCitasCompWidget(
                                                cita: functions.citaMasCercana(
                                                    homeCitasRecordList
                                                        .toList(),
                                                    getCurrentTimestamp,
                                                    currentUserReference),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              if (inicioCiudadesRecord.medicos!
                                      .toList()
                                      .length >
                                  0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Médicos en tu ciudad',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            Color(0xFF001C2C),
                                                      ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'buscarMedicos',
                                                  queryParams: {
                                                    'ciudad': serializeParam(
                                                      inicioCiudadesRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'ciudad':
                                                        inicioCiudadesRecord,
                                                  },
                                                );
                                              },
                                              child: Text(
                                                'Ver todos',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Builder(
                                          builder: (context) {
                                            final medicosEnEstado =
                                                inicioCiudadesRecord.medicos!
                                                    .toList()
                                                    .map((e) => e)
                                                    .toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  medicosEnEstado.length,
                                                  (medicosEnEstadoIndex) {
                                                final medicosEnEstadoItem =
                                                    medicosEnEstado[
                                                        medicosEnEstadoIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 20),
                                                  child: StreamBuilder<
                                                      MedicosRecord>(
                                                    stream: MedicosRecord
                                                        .getDocument(
                                                            medicosEnEstadoItem),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      final menuItemMedicosRecord =
                                                          snapshot.data!;
                                                      return InkWell(
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'medico',
                                                            queryParams: {
                                                              'medico':
                                                                  serializeParam(
                                                                medicosEnEstadoItem,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3,
                                                                color: Color(
                                                                    0x411D2429),
                                                                offset: Offset(
                                                                    0, 1),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        8,
                                                                        8,
                                                                        8),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          1,
                                                                          1,
                                                                          1),
                                                                  child: StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord.getDocument(
                                                                        menuItemMedicosRecord
                                                                            .parentReference),
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
                                                                      final imageUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            imageUsersRecord.photoUrl,
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/xij2t4ymf6c9/isotipo2.png',
                                                                          ),
                                                                          width:
                                                                              70,
                                                                          height:
                                                                              100,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            4,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          menuItemMedicosRecord
                                                                              .nombre!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF090F13),
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                4,
                                                                                8,
                                                                                0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              functions.listaToString(menuItemMedicosRecord.especialidades!.toList()).maybeHandleOverflow(
                                                                                    maxChars: 70,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .chevron_right_rounded,
                                                                        color: Color(
                                                                            0xFF57636C),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                    if (menuItemMedicosRecord
                                                                            .citasCreadas!
                                                                            .toList()
                                                                            .length >
                                                                        0)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            4,
                                                                            8),
                                                                        child:
                                                                            Text(
                                                                          'Citas disponibles',
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF067422),
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (inicioCiudadesRecord.medicos!
                                      .toList()
                                      .length ==
                                  0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 20, 16, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Lottie.asset(
                                              'assets/lottie_animations/98121-empty-state.json',
                                              width: 250,
                                              height: 250,
                                              fit: BoxFit.contain,
                                              animate: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Por ahora no hay médicos en tu estado, intentalo más tarde.',
                                        textAlign: TextAlign.center,
                                        style:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation2']!,
                      );
                    },
                  ),
                ),
                if (_model.menuAbierto)
                  Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: InkWell(
                      onTap: () async {
                        if (_model.menuAbierto) {
                          if (animationsMap[
                                  'containerOnActionTriggerAnimation2'] !=
                              null) {
                            animationsMap['containerOnActionTriggerAnimation2']!
                                .controller
                                .forward()
                                .whenComplete(animationsMap[
                                        'containerOnActionTriggerAnimation2']!
                                    .controller
                                    .reverse);
                          }
                          if (animationsMap[
                                  'containerOnActionTriggerAnimation1'] !=
                              null) {
                            animationsMap['containerOnActionTriggerAnimation1']!
                                .controller
                                .forward()
                                .whenComplete(animationsMap[
                                        'containerOnActionTriggerAnimation1']!
                                    .controller
                                    .reverse);
                          }
                          if (animationsMap[
                                  'containerOnActionTriggerAnimation3'] !=
                              null) {
                            animationsMap['containerOnActionTriggerAnimation3']!
                                .controller
                                .forward()
                                .whenComplete(animationsMap[
                                        'containerOnActionTriggerAnimation3']!
                                    .controller
                                    .reverse);
                          }
                          setState(() {
                            _model.menuAbierto = false;
                          });
                        }
                      },
                      child: Container(
                        width: 117.7,
                        height: 680.8,
                        decoration: BoxDecoration(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
