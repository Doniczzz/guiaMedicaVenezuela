import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/enviar_mensaje_paciente_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notificaciones_model.dart';
export 'notificaciones_model.dart';

class NotificacionesWidget extends StatefulWidget {
  const NotificacionesWidget({Key? key}) : super(key: key);

  @override
  _NotificacionesWidgetState createState() => _NotificacionesWidgetState();
}

class _NotificacionesWidgetState extends State<NotificacionesWidget> {
  late NotificacionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificacionesModel());
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            Text(
              'Mensajes',
              style: FlutterFlowTheme.of(context).title2,
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: AuthUserStreamWidget(
              builder: (context) => Builder(
                builder: (context) {
                  final notificaciones =
                      (currentUserDocument?.notificaciones?.toList() ?? [])
                          .toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: notificaciones.length,
                    itemBuilder: (context, notificacionesIndex) {
                      final notificacionesItem =
                          notificaciones[notificacionesIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: StreamBuilder<NotificacionRecord>(
                          stream: NotificacionRecord.getDocument(
                              notificacionesItem),
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
                            final contentView2NotificacionRecord =
                                snapshot.data!;
                            return InkWell(
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: EnviarMensajePacienteWidget(
                                        notificacion:
                                            contentView2NotificacionRecord,
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      offset: Offset(0.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(0.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 4.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: random_data.randomColor(),
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              contentView2NotificacionRecord
                                                  .mensaje,
                                              '0',
                                            ).maybeHandleOverflow(
                                              maxChars: 20,
                                              replacement: '…',
                                            ),
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          dateTimeFormat(
                                            'd/M/y',
                                            contentView2NotificacionRecord
                                                .fecha!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: FaIcon(
                                          FontAwesomeIcons.trash,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          await contentView2NotificacionRecord
                                              .reference
                                              .delete();

                                          final usersUpdateData = {
                                            'notificaciones':
                                                FieldValue.arrayRemove(
                                                    [notificacionesItem]),
                                          };
                                          await currentUserReference!
                                              .update(usersUpdateData);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
