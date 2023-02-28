import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/eliminar_cuenta_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editar_mi_cuenta_model.dart';
export 'editar_mi_cuenta_model.dart';

class EditarMiCuentaWidget extends StatefulWidget {
  const EditarMiCuentaWidget({Key? key}) : super(key: key);

  @override
  _EditarMiCuentaWidgetState createState() => _EditarMiCuentaWidgetState();
}

class _EditarMiCuentaWidgetState extends State<EditarMiCuentaWidget>
    with TickerProviderStateMixin {
  late EditarMiCuentaModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(400.0, 0.0),
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
          duration: 600.ms,
          begin: Offset(400.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(400.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(400.0, 0.0),
          end: Offset(0.0, 0.0),
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
    _model = createModel(context, () => EditarMiCuentaModel());

    _model.nombreController ??= TextEditingController();
    _model.whatsController ??= TextEditingController();
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
      height: 277.8,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Icon(
                          Icons.person,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation2']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Cambiar nombre',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation1']!,
                            ),
                            Container(
                              width: double.infinity,
                              height: 46.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                border: Border.all(
                                  color: Color(0xFFC2C7CC),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _model.nombreController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.nombreController',
                                          Duration(milliseconds: 1000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Cambiar nombre',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'DM Sans',
                                                    color: Color(0xFF606060),
                                                  ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        validator: _model
                                            .nombreControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    if (_model.nombreController.text != null &&
                                        _model.nombreController.text != '')
                                      InkWell(
                                        onTap: () async {
                                          final usersUpdateData =
                                              createUsersRecordData(
                                            displayName:
                                                _model.nombreController.text,
                                          );
                                          await currentUserReference!
                                              .update(usersUpdateData);
                                          setState(() {
                                            _model.nombreController?.clear();
                                          });
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
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Nombre cambiado',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.check_circle,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 24.0,
                                        ),
                                      ),
                                    if (_model.nombreController.text == null ||
                                        _model.nombreController.text == '')
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            _model.nombreController?.clear();
                                          });
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
                                        },
                                        child: Icon(
                                          Icons.arrow_right_outlined,
                                          color: Color(0xFF868E97),
                                          size: 24.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation2']!,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation4'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation4']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Cambiar Whatsapp',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'containerOnActionTriggerAnimation3']!,
                            ),
                            FutureBuilder<ApiCallResponse>(
                              future: VerificarTelefonoCall.call(
                                phone: _model.whatsController.text,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final inputWhatsVerificarTelefonoResponse =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  height: 46.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    border: Border.all(
                                      color: Color(0xFFC2C7CC),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: AuthUserStreamWidget(
                                            builder: (context) => TextFormField(
                                              controller:
                                                  _model.whatsController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.whatsController',
                                                Duration(milliseconds: 1000),
                                                () => setState(() {}),
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText:
                                                    valueOrDefault<String>(
                                                  currentPhoneNumber,
                                                  'Ej.  580416123456',
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily: 'DM Sans',
                                                          color:
                                                              Color(0xFF606060),
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              validator: _model
                                                  .whatsControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        if ((_model.whatsController.text !=
                                                    null &&
                                                _model.whatsController.text !=
                                                    '') &&
                                            valueOrDefault<bool>(
                                              VerificarTelefonoCall
                                                  .verificarNumero(
                                                inputWhatsVerificarTelefonoResponse
                                                    .jsonBody,
                                              ),
                                              false,
                                            ))
                                          InkWell(
                                            onTap: () async {
                                              if (VerificarTelefonoCall
                                                  .verificarNumero(
                                                inputWhatsVerificarTelefonoResponse
                                                    .jsonBody,
                                              )) {
                                                final usersUpdateData =
                                                    createUsersRecordData(
                                                  phoneNumber:
                                                      VerificarTelefonoCall
                                                          .numero(
                                                    inputWhatsVerificarTelefonoResponse
                                                        .jsonBody,
                                                  ).toString(),
                                                );
                                                await currentUserReference!
                                                    .update(usersUpdateData);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Nombre cambiado',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                  ),
                                                );
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Error!'),
                                                      content: Text(
                                                          'Número incorrecto, debes colocarlo con código de país, Ej. +58426111222'),
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
                                              }

                                              setState(() {
                                                _model.whatsController?.clear();
                                              });
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
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation4'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation4']!
                                                    .controller
                                                    .forward()
                                                    .whenComplete(animationsMap[
                                                            'containerOnActionTriggerAnimation4']!
                                                        .controller
                                                        .reverse);
                                              }
                                            },
                                            child: Icon(
                                              Icons.check_circle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 24.0,
                                            ),
                                          ),
                                        if (_model.whatsController.text ==
                                                null ||
                                            _model.whatsController.text == '')
                                          InkWell(
                                            onTap: () async {
                                              setState(() {
                                                _model.whatsController?.clear();
                                              });
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
                                              if (animationsMap[
                                                      'containerOnActionTriggerAnimation4'] !=
                                                  null) {
                                                animationsMap[
                                                        'containerOnActionTriggerAnimation4']!
                                                    .controller
                                                    .forward()
                                                    .whenComplete(animationsMap[
                                                            'containerOnActionTriggerAnimation4']!
                                                        .controller
                                                        .reverse);
                                              }
                                            },
                                            child: Icon(
                                              Icons.arrow_right_outlined,
                                              color: Color(0xFF868E97),
                                              size: 24.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'containerOnActionTriggerAnimation4']!,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                context.pushNamed(
                  'listaEstados',
                  queryParams: {
                    'editandoPerfil': serializeParam(
                      true,
                      ParamType.bool,
                    ),
                  }.withoutNulls,
                );
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/vecteezy_glossy-button-circle-shaped-illustration-of-venezuela-flag_16872690-[Convertido].png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cambiar Estado',
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: EliminarCuentaWidget(),
                    );
                  },
                ).then((value) => setState(() {}));
              },
              child: Container(
                width: double.infinity,
                height: 60.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: Icon(
                            Icons.warning,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 20.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Eliminar mi cuenta',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                              ),
                            ],
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
