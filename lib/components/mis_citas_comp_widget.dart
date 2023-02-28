import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mis_citas_comp_model.dart';
export 'mis_citas_comp_model.dart';

class MisCitasCompWidget extends StatefulWidget {
  const MisCitasCompWidget({
    Key? key,
    this.cita,
  }) : super(key: key);

  final DocumentReference? cita;

  @override
  _MisCitasCompWidgetState createState() => _MisCitasCompWidgetState();
}

class _MisCitasCompWidgetState extends State<MisCitasCompWidget> {
  late MisCitasCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MisCitasCompModel());
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
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final containerCitasRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Color(0xF2EAEAEA),
            ),
          ),
          child: StreamBuilder<MedicosRecord>(
            stream: MedicosRecord.getDocument(containerCitasRecord.medico!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              final columnMedicosRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(
                          columnMedicosRecord.parentReference),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final rowUsersRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 36.0,
                              height: 36.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  rowUsersRecord.photoUrl,
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/xij2t4ymf6c9/isotipo2.png',
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      rowUsersRecord.displayName!,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .fondoMenu,
                                            fontSize: 16.0,
                                          ),
                                    ),
                                    Text(
                                      containerCitasRecord.especialidad!,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (functions
                                    .retornarPaciente(currentUserReference,
                                        containerCitasRecord)
                                    .status ==
                                2)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 16.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Aprobado',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            if (functions
                                    .retornarPaciente(currentUserReference,
                                        containerCitasRecord)
                                    .status ==
                                1)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Color(0xFF656509),
                                    size: 16.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'En espera',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Color(0xF2EAEAEA),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            size: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '${functions.retornarDia(containerCitasRecord.fecha!)}, ${dateTimeFormat(
                                'd/M',
                                containerCitasRecord.fecha,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.timer,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 20.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              dateTimeFormat(
                                'jm',
                                containerCitasRecord.fecha!,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
