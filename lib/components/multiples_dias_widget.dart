import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'multiples_dias_model.dart';
export 'multiples_dias_model.dart';

class MultiplesDiasWidget extends StatefulWidget {
  const MultiplesDiasWidget({
    Key? key,
    this.medico,
  }) : super(key: key);

  final DocumentReference? medico;

  @override
  _MultiplesDiasWidgetState createState() => _MultiplesDiasWidgetState();
}

class _MultiplesDiasWidgetState extends State<MultiplesDiasWidget> {
  late MultiplesDiasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiplesDiasModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        if (!_model.confirmacion!)
          Container(
            height: 838,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Text(
                    'Define a continuación los dias.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title2,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                ),
                FlutterFlowCalendar(
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  iconColor: FlutterFlowTheme.of(context).primaryText,
                  weekFormat: true,
                  weekStartsMonday: false,
                  onChange: (DateTimeRange? newSelectedDate) async {
                    _model.calendarSelectedDay = newSelectedDate;
                    if (getCurrentTimestamp <
                        _model.calendarSelectedDay!.start) {
                      if (_model.dates
                          .contains(_model.calendarSelectedDay?.end)) {
                        setState(() {
                          _model
                              .removeFromDates(_model.calendarSelectedDay!.end);
                        });
                      } else {
                        if (_model.dates.length == 5) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Error!'),
                                content: Text('Máxmo 5 días.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          setState(() {
                            _model.addToDates(_model.calendarSelectedDay!.end);
                          });
                        }
                      }
                    }
                    setState(() {});
                  },
                  titleStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 25,
                  ),
                  dayOfWeekStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  dateStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  selectedDateStyle: TextStyle(),
                  inactiveDateStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  locale: FFLocalizations.of(context).languageCode,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final fechas = _model.dates.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: fechas.length,
                              itemBuilder: (context, fechasIndex) {
                                final fechasItem = fechas[fechasIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Color(0x25000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 4, 8),
                                              child: Container(
                                                width: 4,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  color:
                                                      random_data.randomColor(),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 16, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    functions.retornarDia(
                                                        fechasItem),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      '-------',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'd/M',
                                                        fechasItem,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: FaIcon(
                                              FontAwesomeIcons.trash,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                _model.removeFromDates(
                                                    fechasItem);
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (_model.dates.length > 0)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final _datePickedTime = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                        );
                        if (_datePickedTime != null) {
                          setState(() {
                            _model.datePicked = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePickedTime.hour,
                              _datePickedTime.minute,
                            );
                          });
                        }
                        setState(() {
                          _model.confirmacion = true;
                        });
                      },
                      text: 'Definir Hora',
                      icon: Icon(
                        Icons.access_time,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: 150,
                        height: 50,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                  ),
              ],
            ),
          ),
        if (_model.confirmacion ?? true)
          Container(
            height: 787.5,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final fechas = _model.dates.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: fechas.length,
                              itemBuilder: (context, fechasIndex) {
                                final fechasItem = fechas[fechasIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Color(0x25000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 4, 8),
                                              child: Container(
                                                width: 4,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                  color:
                                                      random_data.randomColor(),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 16, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    functions.retornarDia(
                                                        fechasItem),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Text(
                                                      '-------',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons
                                                            .calendar,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 4, 0, 0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'd/M',
                                                            fechasItem,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(25, 0,
                                                                    0, 0),
                                                        child: Icon(
                                                          Icons.access_time,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 4, 0, 0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'jm',
                                                            _model.datePicked,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'DM Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: FaIcon(
                                              FontAwesomeIcons.trash,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 30,
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                _model.removeFromDates(
                                                    fechasItem);
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            _model.dates = [];
                            _model.confirmacion = false;
                          });
                        },
                        text: 'Editar',
                        icon: FaIcon(
                          FontAwesomeIcons.edit,
                        ),
                        options: FFButtonOptions(
                          width: 150,
                          height: 50,
                          color: FlutterFlowTheme.of(context).secondaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
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
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: FFButtonWidget(
                        onPressed: () async {
                          setState(() {
                            FFAppState().dates = functions
                                .editListDates(
                                    _model.dates.toList(), _model.datePicked!)
                                .toList();
                          });
                          Navigator.pop(context);
                        },
                        text: 'Confirmar',
                        icon: Icon(
                          Icons.check,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 150,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
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
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
