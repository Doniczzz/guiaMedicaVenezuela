import '/backend/backend.dart';
import '/components/shimmer_v_widget.dart';
import '/components/soporte_estado_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'estados_model.dart';
export 'estados_model.dart';

class EstadosWidget extends StatefulWidget {
  const EstadosWidget({Key? key}) : super(key: key);

  @override
  _EstadosWidgetState createState() => _EstadosWidgetState();
}

class _EstadosWidgetState extends State<EstadosWidget>
    with TickerProviderStateMixin {
  late EstadosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstadosModel());
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 76.3,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: FlutterFlowTheme.of(context).fondoMenu,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.pop();
                          },
                        ),
                        Text(
                          'Estados',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).fondoMenu,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Image.asset(
                            'assets/images/perfil.png',
                            width: 30.0,
                            height: 30.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: LinearPercentIndicator(
                      percent: 1.0,
                      width: MediaQuery.of(context).size.width * 1.0,
                      lineHeight: 12.0,
                      animation: true,
                      progressColor:
                          FlutterFlowTheme.of(context).secondaryColor,
                      backgroundColor: FlutterFlowTheme.of(context).lineColor,
                      barRadius: Radius.circular(0.0),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: StreamBuilder<List<EstadosRecord>>(
                      stream: queryEstadosRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: ShimmerVWidget(),
                          );
                        }
                        List<EstadosRecord> listViewEstadosRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewEstadosRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewEstadosRecord =
                                listViewEstadosRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'ciudades',
                                    queryParams: {
                                      'estado': serializeParam(
                                        listViewEstadosRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: Color(0xFFE0E3E7),
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.terrain_outlined,
                                          color: Colors.black,
                                          size: 40.0,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewEstadosRecord.estado!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF101213),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                FutureBuilder<int>(
                                                  future:
                                                      queryCiudadesRecordCount(
                                                    parent:
                                                        listViewEstadosRecord
                                                            .reference,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFoldingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryColor,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int richTextCount =
                                                        snapshot.data!;
                                                    return RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Ciudades:  ',
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: richTextCount
                                                                .toString(),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                            ),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: Color(0xFFF1F4F8),
                                          elevation: 1.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 4.0),
                                            child: Icon(
                                              Icons
                                                  .keyboard_arrow_right_rounded,
                                              color: Color(0xFF57636C),
                                              size: 24.0,
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
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 140.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x001D2429),
                        FlutterFlowTheme.of(context).secondaryBackground
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
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
                    text: '¿Tu Estado no está en la lista?',
                    options: FFButtonOptions(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 15.0, 15.0, 15.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'DM Sans',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
