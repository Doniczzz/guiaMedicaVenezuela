import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'enviar_mensaje_medico_model.dart';
export 'enviar_mensaje_medico_model.dart';

class EnviarMensajeMedicoWidget extends StatefulWidget {
  const EnviarMensajeMedicoWidget({
    Key? key,
    this.medico,
  }) : super(key: key);

  final DocumentReference? medico;

  @override
  _EnviarMensajeMedicoWidgetState createState() =>
      _EnviarMensajeMedicoWidgetState();
}

class _EnviarMensajeMedicoWidgetState extends State<EnviarMensajeMedicoWidget> {
  late EnviarMensajeMedicoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnviarMensajeMedicoModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.medico!),
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
          final postCreateUsersRecord = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 224.3,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x162D3A21),
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Envía un mensaje al médico.',
                              textAlign: TextAlign.center,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Lexend',
                                        fontSize: 14,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: TextFormField(
                                controller: _model.textController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Escribe tu solicitud',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
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
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 8, 12),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                maxLines: 3,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 12,
                      thickness: 2,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              final notificacionCreateData =
                                  createNotificacionRecordData(
                                de: currentUserReference,
                                para: widget.medico,
                                mensaje: _model.textController.text,
                                fecha: getCurrentTimestamp,
                              );
                              var notificacionRecordReference =
                                  NotificacionRecord.collection.doc();
                              await notificacionRecordReference
                                  .set(notificacionCreateData);
                              _model.noti =
                                  NotificacionRecord.getDocumentFromData(
                                      notificacionCreateData,
                                      notificacionRecordReference);

                              final usersUpdateData = {
                                'notificaciones': FieldValue.arrayUnion(
                                    [_model.noti!.reference]),
                              };
                              await widget.medico!.update(usersUpdateData);
                              if (postCreateUsersRecord.pushNotification!) {
                                triggerPushNotification(
                                  notificationTitle:
                                      '¡Nuevo Mensaje de Paciente!',
                                  notificationText:
                                      'Has recibido un mensaje, ve a tus notificaciones.',
                                  notificationSound: 'default',
                                  userRefs: [widget.medico!],
                                  initialPageName: 'home',
                                  parameterData: {},
                                );
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '¡Tu mensaje fue enviado!',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              );
                              Navigator.pop(context);

                              setState(() {});
                            },
                            text: 'Enviar',
                            options: FFButtonOptions(
                              width: 90,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
