import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'borrar_cita_model.dart';
export 'borrar_cita_model.dart';

class BorrarCitaWidget extends StatefulWidget {
  const BorrarCitaWidget({
    Key? key,
    this.cita,
    this.medico,
  }) : super(key: key);

  final DocumentReference? cita;
  final DocumentReference? medico;

  @override
  _BorrarCitaWidgetState createState() => _BorrarCitaWidgetState();
}

class _BorrarCitaWidgetState extends State<BorrarCitaWidget> {
  late BorrarCitaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BorrarCitaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
      child: InkWell(
        onTap: () async {
          final medicosUpdateData = {
            'citasCreadas': FieldValue.arrayRemove([widget.cita]),
          };
          await widget.medico!.update(medicosUpdateData);
          await widget.cita!.delete();
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(
            'citasCreadas',
            queryParams: {
              'medico': serializeParam(
                widget.medico,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: double.infinity,
          height: 99.5,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).alternate,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x411D2429),
                offset: Offset(0.0, -2.0),
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 44.0),
            child: Text(
              '¿Borrar esta cita?',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Lexend',
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
