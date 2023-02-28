import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/enviar_mensaje_paciente_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'paciente_model.dart';
export 'paciente_model.dart';

class PacienteWidget extends StatefulWidget {
  const PacienteWidget({
    Key? key,
    this.paciente,
    int? numeroPaciente,
  })  : this.numeroPaciente = numeroPaciente ?? 0,
        super(key: key);

  final PacientesStruct? paciente;
  final int numeroPaciente;

  @override
  _PacienteWidgetState createState() => _PacienteWidgetState();
}

class _PacienteWidgetState extends State<PacienteWidget>
    with TickerProviderStateMixin {
  late PacienteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PacienteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 877.6,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).gray200,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(widget.paciente!.paciente!),
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
            final columnUsersRecord = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 34.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            widget.paciente?.nombrePaciente,
                            'Sin definir',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Lexend',
                                color: FlutterFlowTheme.of(context).fondoMenu,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Cedula: ${valueOrDefault<String>(
                      widget.paciente?.cedula?.toString(),
                      '0',
                    )}',
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.of(context).fondoMenu,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                    child: InkWell(
                      onTap: () async {
                        final notificacionCreateData =
                            createNotificacionRecordData(
                          de: columnUsersRecord.reference,
                          para: widget.paciente?.paciente,
                        );
                        var notificacionRecordReference =
                            NotificacionRecord.collection.doc();
                        await notificacionRecordReference
                            .set(notificacionCreateData);
                        _model.noti = NotificacionRecord.getDocumentFromData(
                            notificacionCreateData,
                            notificacionRecordReference);
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: EnviarMensajePacienteWidget(
                                notificacion: _model.noti,
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        setState(() {});
                      },
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: Color(0xFFE0E3E7),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Enviar Mensaje',
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            Icon(
                              Icons.near_me,
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 12.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'Método de pago',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                      ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.paciente?.metodoPago,
                                  'Sin definir',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF101213),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 12.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'Número de paciente',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                      ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.numeroPaciente.toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF101213),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 12.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'Número de referencia',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                      ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.paciente?.numeroReferencia,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF101213),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 12.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'Motivo de cita',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                      ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.paciente?.motivoCita,
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF101213),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (widget.paciente?.metodoPago == 'Transferencia')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 25.0, 16.0, 12.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.paciente?.tipoTransferencia,
                                      'Sin definir',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'DM Sans',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              widget.paciente?.comprobante,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/inacqqunop3h/isotipo.png',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: valueOrDefault<String>(
                                            widget.paciente?.comprobante,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/inacqqunop3h/isotipo.png',
                                          ),
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  onDoubleTap: () async {
                                    await actions.descargaImagen(
                                      widget.paciente?.comprobante,
                                      isiOS,
                                      isAndroid,
                                    );
                                  },
                                  child: Hero(
                                    tag: valueOrDefault<String>(
                                      widget.paciente?.comprobante,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/inacqqunop3h/isotipo.png',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        widget.paciente?.comprobante,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/inacqqunop3h/isotipo.png',
                                      ),
                                      width: double.infinity,
                                      height: 668.8,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Doble click para descargar',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'DM Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontWeight: FontWeight.w600,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
