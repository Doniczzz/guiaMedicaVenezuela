import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_estado_widget.dart';
import '/components/shimmer_v_widget.dart';
import '/components/soporte_estado_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'lista_ciudades_model.dart';
export 'lista_ciudades_model.dart';

class ListaCiudadesWidget extends StatefulWidget {
  const ListaCiudadesWidget({
    Key? key,
    this.estado,
    bool? editandoPerfil,
  })  : this.editandoPerfil = editandoPerfil ?? false,
        super(key: key);

  final DocumentReference? estado;
  final bool editandoPerfil;

  @override
  _ListaCiudadesWidgetState createState() => _ListaCiudadesWidgetState();
}

class _ListaCiudadesWidgetState extends State<ListaCiudadesWidget>
    with TickerProviderStateMixin {
  late ListaCiudadesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaCiudadesModel());
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
                    fontSize: 12.0,
                  ),
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
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    child: StreamBuilder<List<CiudadesRecord>>(
                      stream: queryCiudadesRecord(
                        parent: widget.estado,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: ShimmerVWidget(),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: InkWell(
                                onTap: () async {
                                  if (widget.editandoPerfil) {
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

                                    final usersUpdateData1 =
                                        createUsersRecordData(
                                      dondeVive: createDondeViveStruct(
                                        estado: listViewCiudadesRecord
                                            .parentReference,
                                        ciudad:
                                            listViewCiudadesRecord.reference,
                                        clearUnsetFields: false,
                                      ),
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData1);

                                    final ciudadesUpdateData1 = {
                                      'usuarios': FieldValue.arrayRemove(
                                          [currentUserReference]),
                                    };
                                    await currentUserDocument!.dondeVive.ciudad!
                                        .update(ciudadesUpdateData1);

                                    final ciudadesUpdateData2 = {
                                      'usuarios': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    };
                                    await listViewCiudadesRecord.reference
                                        .update(ciudadesUpdateData2);
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));

                                    context.goNamed('miCuenta');
                                  } else {
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

                                    final usersUpdateData2 =
                                        createUsersRecordData(
                                      dondeVive: createDondeViveStruct(
                                        estado: listViewCiudadesRecord
                                            .parentReference,
                                        ciudad:
                                            listViewCiudadesRecord.reference,
                                        clearUnsetFields: false,
                                      ),
                                    );
                                    await currentUserReference!
                                        .update(usersUpdateData2);

                                    final ciudadesUpdateData3 = {
                                      'usuarios': FieldValue.arrayUnion(
                                          [currentUserReference]),
                                    };
                                    await listViewCiudadesRecord.reference
                                        .update(ciudadesUpdateData3);
                                    await Future.delayed(
                                        const Duration(milliseconds: 1000));

                                    context.goNamed(
                                      'registro',
                                      queryParams: {
                                        'tieneEstado': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }
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
                                                  listViewCiudadesRecord
                                                      .ciudad!,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                    text: '¿Tu ciudad no está en la lista?',
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
