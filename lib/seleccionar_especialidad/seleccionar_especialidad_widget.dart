import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'seleccionar_especialidad_model.dart';
export 'seleccionar_especialidad_model.dart';

class SeleccionarEspecialidadWidget extends StatefulWidget {
  const SeleccionarEspecialidadWidget({
    Key? key,
    this.medico,
  }) : super(key: key);

  final MedicosRecord? medico;

  @override
  _SeleccionarEspecialidadWidgetState createState() =>
      _SeleccionarEspecialidadWidgetState();
}

class _SeleccionarEspecialidadWidgetState
    extends State<SeleccionarEspecialidadWidget> with TickerProviderStateMixin {
  late SeleccionarEspecialidadModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeleccionarEspecialidadModel());

    _model.textController ??= TextEditingController();
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
          child: StreamBuilder<List<EspecialidadesRecord>>(
            stream: queryEspecialidadesRecord(
              queryBuilder: (especialidadesRecord) =>
                  especialidadesRecord.orderBy('especialidad'),
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
              List<EspecialidadesRecord> containerEspecialidadesRecordList =
                  snapshot.data!;
              return Container(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                                        'Especialidades',
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
                        if (_model.especialidades.length > 0)
                          FFButtonWidget(
                            onPressed: () async {
                              final medicosUpdateData = {
                                'especialidades': _model.especialidades,
                              };
                              await widget.medico!.reference
                                  .update(medicosUpdateData);

                              context.goNamed(
                                'crearMedico',
                                queryParams: {
                                  'medico': serializeParam(
                                    widget.medico,
                                    ParamType.Document,
                                  ),
                                  'listEspecialidades': serializeParam(
                                    _model.especialidades,
                                    ParamType.String,
                                    true,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'medico': widget.medico,
                                },
                              );
                            },
                            text: 'Guardar Selección',
                            icon: Icon(
                              Icons.save,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        Divider(
                          height: 10,
                          thickness: 5,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 0),
                                    child: Icon(
                                      Icons.search_rounded,
                                      color: Color(0xFFACB9C4),
                                      size: 24,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: Autocomplete<String>(
                                        initialValue: TextEditingValue(),
                                        optionsBuilder: (textEditingValue) {
                                          if (textEditingValue.text == '') {
                                            return const Iterable<
                                                String>.empty();
                                          }
                                          return containerEspecialidadesRecordList
                                              .map((e) => e.especialidad)
                                              .withoutNulls
                                              .toList()
                                              .toList()
                                              .where((option) {
                                            final lowercaseOption =
                                                option.toLowerCase();
                                            return lowercaseOption.contains(
                                                textEditingValue.text
                                                    .toLowerCase());
                                          });
                                        },
                                        optionsViewBuilder:
                                            (context, onSelected, options) {
                                          return AutocompleteOptionsList(
                                            textFieldKey: _model.textFieldKey,
                                            textController:
                                                _model.textController!,
                                            options: options.toList(),
                                            onSelected: onSelected,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            textHighlightStyle: TextStyle(),
                                            elevation: 4,
                                            optionBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            optionHighlightColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            maxHeight: 200,
                                          );
                                        },
                                        onSelected: (String selection) {
                                          setState(() =>
                                              _model.textFieldSelectedOption =
                                                  selection);
                                          FocusScope.of(context).unfocus();
                                        },
                                        fieldViewBuilder: (
                                          context,
                                          textEditingController,
                                          focusNode,
                                          onEditingComplete,
                                        ) {
                                          _model.textController =
                                              textEditingController;
                                          return TextFormField(
                                            key: _model.textFieldKey,
                                            controller: textEditingController,
                                            focusNode: focusNode,
                                            onEditingComplete:
                                                onEditingComplete,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              Duration(milliseconds: 1000),
                                              () async {
                                                setState(() {
                                                  _model.simpleSearchResults =
                                                      TextSearch(
                                                    containerEspecialidadesRecordList
                                                        .map(
                                                          (record) =>
                                                              TextSearchItem(
                                                                  record, [
                                                            record.especialidad!
                                                          ]),
                                                        )
                                                        .toList(),
                                                  )
                                                          .search(_model
                                                              .textController
                                                              .text)
                                                          .map((r) => r.object)
                                                          .toList();
                                                });
                                                setState(() {
                                                  _model.busqueda = true;
                                                });
                                              },
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Buscar',
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF95A1AC),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 4, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        setState(() {
                                          _model.textController?.clear();
                                        });
                                        setState(() {
                                          _model.busqueda = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: Color(0xFFACB9C4),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (!_model.busqueda)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Builder(
                              builder: (context) {
                                final especialidades =
                                    containerEspecialidadesRecordList.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: especialidades.length,
                                  itemBuilder: (context, especialidadesIndex) {
                                    final especialidadesItem =
                                        especialidades[especialidadesIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 8),
                                      child: InkWell(
                                        onTap: () async {
                                          if (_model.especialidades.contains(
                                              especialidadesItem
                                                  .especialidad)) {
                                            setState(() {
                                              _model.removeFromEspecialidades(
                                                  especialidadesItem
                                                      .especialidad!);
                                            });

                                            final especialidadesUpdateData1 = {
                                              'medicos': FieldValue.arrayRemove(
                                                  [widget.medico!.reference]),
                                            };
                                            await especialidadesItem.reference
                                                .update(
                                                    especialidadesUpdateData1);
                                          } else {
                                            setState(() {
                                              _model.addToEspecialidades(
                                                  especialidadesItem
                                                      .especialidad!);
                                            });

                                            final especialidadesUpdateData2 = {
                                              'medicos': FieldValue.arrayUnion(
                                                  [widget.medico!.reference]),
                                            };
                                            await especialidadesItem.reference
                                                .update(
                                                    especialidadesUpdateData2);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 5, 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.double_arrow_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 34,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(12, 12,
                                                                  12, 12),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                especialidadesItem
                                                                    .especialidad!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title3
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF101213),
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.especialidades
                                                    .contains(especialidadesItem
                                                        .especialidad))
                                                  Icon(
                                                    Icons.check_box,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 24,
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
                        if (_model.busqueda)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Builder(
                              builder: (context) {
                                final especialidades =
                                    _model.simpleSearchResults.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: especialidades.length,
                                  itemBuilder: (context, especialidadesIndex) {
                                    final especialidadesItem =
                                        especialidades[especialidadesIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 8),
                                      child: InkWell(
                                        onTap: () async {
                                          if (_model.especialidades.contains(
                                              especialidadesItem
                                                  .especialidad)) {
                                            setState(() {
                                              _model.removeFromEspecialidades(
                                                  especialidadesItem
                                                      .especialidad!);
                                            });

                                            final especialidadesUpdateData1 = {
                                              'medicos': FieldValue.arrayRemove(
                                                  [widget.medico!.reference]),
                                            };
                                            await especialidadesItem.reference
                                                .update(
                                                    especialidadesUpdateData1);
                                          } else {
                                            setState(() {
                                              _model.addToEspecialidades(
                                                  especialidadesItem
                                                      .especialidad!);
                                            });

                                            final especialidadesUpdateData2 = {
                                              'medicos': FieldValue.arrayUnion(
                                                  [widget.medico!.reference]),
                                            };
                                            await especialidadesItem.reference
                                                .update(
                                                    especialidadesUpdateData2);
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 5, 5),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.double_arrow_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 34,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(12, 12,
                                                                  12, 12),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                especialidadesItem
                                                                    .especialidad!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title3
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF101213),
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (_model.especialidades
                                                    .contains(especialidadesItem
                                                        .especialidad))
                                                  Icon(
                                                    Icons.check_box,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 24,
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
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
