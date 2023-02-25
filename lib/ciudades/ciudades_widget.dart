import '../backend/backend.dart';
import '../components/loading_estado_widget.dart';
import '../components/soporte_estado_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'ciudades_model.dart';
export 'ciudades_model.dart';

class CiudadesWidget extends StatefulWidget {
  const CiudadesWidget({
    Key? key,
    this.estado,
  }) : super(key: key);

  final DocumentReference? estado;

  @override
  _CiudadesWidgetState createState() => _CiudadesWidgetState();
}

class _CiudadesWidgetState extends State<CiudadesWidget>
    with TickerProviderStateMixin {
  late CiudadesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CiudadesModel());
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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecciona tu ciudad',
              style: FlutterFlowTheme.of(context).title3,
            ),
            Text(
              'Busca médicos en tu ciudad',
              style: FlutterFlowTheme.of(context).bodyText2.override(
                    fontFamily: 'DM Sans',
                    fontSize: 12,
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: LinearPercentIndicator(
                    percent: 1,
                    width: MediaQuery.of(context).size.width,
                    lineHeight: 12,
                    animation: true,
                    progressColor: FlutterFlowTheme.of(context).secondaryColor,
                    backgroundColor: FlutterFlowTheme.of(context).lineColor,
                    barRadius: Radius.circular(0),
                    padding: EdgeInsets.zero,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: StreamBuilder<List<CiudadesRecord>>(
                    stream: queryCiudadesRecord(
                      parent: widget.estado,
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
                      List<CiudadesRecord> listViewCiudadesRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCiudadesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCiudadesRecord =
                              listViewCiudadesRecordList[listViewIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: InkWell(
                              onTap: () async {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  isDismissible: false,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: LoadingEstadoWidget(),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                await Future.delayed(
                                    const Duration(milliseconds: 1000));
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  'buscarMedicos',
                                  queryParams: {
                                    'ciudad': serializeParam(
                                      listViewCiudadesRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'ciudad': listViewCiudadesRecord,
                                  },
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0,
                                      color: Color(0xFFE0E3E7),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.terrain_outlined,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewCiudadesRecord.ciudad!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Médicos:  ',
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          listViewCiudadesRecord
                                                              .medicos!
                                                              .toList()
                                                              .length
                                                              .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFFF1F4F8),
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 4, 4, 4),
                                          child: Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            color: Color(0xFF57636C),
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x001D2429),
                      FlutterFlowTheme.of(context).secondaryBackground
                    ],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                ),
                alignment: AlignmentDirectional(0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: SoporteEstadoWidget(),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  text: '¿Tu ciudad no está en la lista?',
                  options: FFButtonOptions(
                    height: 50,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'DM Sans',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
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
