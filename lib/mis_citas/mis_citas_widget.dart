import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/cita_widget.dart';
import '../components/mis_citas_comp_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'mis_citas_model.dart';
export 'mis_citas_model.dart';

class MisCitasWidget extends StatefulWidget {
  const MisCitasWidget({Key? key}) : super(key: key);

  @override
  _MisCitasWidgetState createState() => _MisCitasWidgetState();
}

class _MisCitasWidgetState extends State<MisCitasWidget> {
  late MisCitasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MisCitasModel());
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
        queryBuilder: (citasRecord) => citasRecord.orderBy('fecha'),
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
        List<CitasRecord> misCitasCitasRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () async {
                                  context.pop();
                                },
                                child: Icon(
                                  Icons.chevron_left,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mis citas',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'DM Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textColor,
                                              fontSize: 20,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 10,
                          thickness: 5,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        if (functions
                                .misCitas(currentUserReference,
                                    misCitasCitasRecordList.toList())
                                .length >
                            0)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Builder(
                              builder: (context) {
                                final misCitas = functions
                                    .misCitas(currentUserReference,
                                        misCitasCitasRecordList.toList())
                                    .toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: misCitas.length,
                                  itemBuilder: (context, misCitasIndex) {
                                    final misCitasItem =
                                        misCitas[misCitasIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: StreamBuilder<CitasRecord>(
                                        stream: CitasRecord.getDocument(
                                            misCitasItem),
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
                                                      cita: misCitasItem,
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
                                            child: MisCitasCompWidget(
                                              key: Key(
                                                  'Key05w_${misCitasIndex}_of_${misCitas.length}'),
                                              cita: misCitasItem,
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
                        if (functions
                                .misCitas(currentUserReference,
                                    misCitasCitasRecordList.toList())
                                .length ==
                            0)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 471.9,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Lottie.asset(
                                  'assets/lottie_animations/98121-empty-state.json',
                                  width: 150,
                                  height: 130,
                                  fit: BoxFit.contain,
                                  animate: true,
                                ),
                              ),
                              Text(
                                'Aún no tienes citas',
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Lexend',
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
