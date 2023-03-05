import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'comprobante_model.dart';
export 'comprobante_model.dart';

class ComprobanteWidget extends StatefulWidget {
  const ComprobanteWidget({
    Key? key,
    this.paciente,
    this.cita,
    this.test,
  }) : super(key: key);

  final PacientesStruct? paciente;
  final DocumentReference? cita;
  final List<PacientesStruct>? test;

  @override
  _ComprobanteWidgetState createState() => _ComprobanteWidgetState();
}

class _ComprobanteWidgetState extends State<ComprobanteWidget> {
  late ComprobanteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComprobanteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<CitasRecord>(
      stream: CitasRecord.getDocument(widget.cita!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitFoldingCube(
                color: FlutterFlowTheme.of(context).secondaryColor,
                size: 50.0,
              ),
            ),
          );
        }
        final containerCitasRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x3B1D2429),
                offset: Offset(0.0, -3.0),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(widget.paciente!.paciente!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitFoldingCube(
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                final columnUsersRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: Image.network(
                                        widget.paciente!.comprobante!,
                                        fit: BoxFit.contain,
                                      ),
                                      allowRotation: false,
                                      tag: widget.paciente!.comprobante!,
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: widget.paciente!.comprobante!,
                                transitionOnUserGestures: true,
                                child: Image.network(
                                  widget.paciente!.comprobante!,
                                  width: 318.9,
                                  height: 436.1,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 40.0),
                            child: InkWell(
                              onTap: () async {
                                await actions.descargaImagen(
                                  widget.paciente?.comprobante,
                                  isiOS,
                                  isAndroid,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Descargar Imagen',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'DM Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .fondoMenu,
                                          fontSize: 18.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.download,
                                      color: Colors.black,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final citasUpdateData1 = {
                          'pacientes': FieldValue.arrayRemove([
                            getPacientesFirestoreData(
                              updatePacientesStruct(
                                widget.paciente,
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        };
                        await containerCitasRecord.reference
                            .update(citasUpdateData1);

                        final citasUpdateData2 = {
                          'pacientes': FieldValue.arrayUnion([
                            getPacientesFirestoreData(
                              createPacientesStruct(
                                paciente: widget.paciente?.paciente,
                                metodoPago: widget.paciente?.metodoPago,
                                numeroReferencia:
                                    widget.paciente?.numeroReferencia,
                                comprobante: widget.paciente?.comprobante,
                                status: 2,
                                cedula: widget.paciente?.cedula,
                                motivoCita: widget.paciente?.motivoCita,
                                tipoTransferencia:
                                    widget.paciente?.tipoTransferencia,
                                nombrePaciente: widget.paciente?.nombrePaciente,
                                numeroPaciente: widget.paciente?.numeroPaciente,
                                clearUnsetFields: false,
                              ),
                              true,
                            )
                          ]),
                        };
                        await containerCitasRecord.reference
                            .update(citasUpdateData2);
                        if (columnUsersRecord.pushNotification!) {
                          triggerPushNotification(
                            notificationTitle: '¡Tu cita ha sido confirmada!',
                            notificationText:
                                'El médico ha confirmado tu pago exitosamente.',
                            notificationSound: 'default',
                            userRefs: [columnUsersRecord.reference],
                            initialPageName: 'home',
                            parameterData: {},
                          );
                        }

                        context.goNamed('home');

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Cita confirmada exitosamente',
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
                      },
                      text: 'Aceptar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final citasUpdateData = {
                            'pacientes': FieldValue.arrayRemove([
                              getPacientesFirestoreData(
                                updatePacientesStruct(
                                  widget.paciente,
                                  clearUnsetFields: false,
                                ),
                                true,
                              )
                            ]),
                          };
                          await widget.cita!.update(citasUpdateData);
                          if (columnUsersRecord.pushNotification!) {
                            triggerPushNotification(
                              notificationTitle: '¡Tu cita ha sido rechazada!',
                              notificationText:
                                  'Por alguna razón tu pago fue rechazado, contáctanos si crees que fué un error.',
                              notificationSound: 'default',
                              userRefs: [columnUsersRecord.reference],
                              initialPageName: 'home',
                              parameterData: {},
                            );
                          }

                          context.goNamed('home');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Cita rechazada exitosamente',
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
                        },
                        text: 'Rechazar',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFFF5963),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Cerrar',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 60.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context).subtitle2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
