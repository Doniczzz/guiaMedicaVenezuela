import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'agregar_zelle_model.dart';
export 'agregar_zelle_model.dart';

class AgregarZelleWidget extends StatefulWidget {
  const AgregarZelleWidget({
    Key? key,
    this.medico,
  }) : super(key: key);

  final DocumentReference? medico;

  @override
  _AgregarZelleWidgetState createState() => _AgregarZelleWidgetState();
}

class _AgregarZelleWidgetState extends State<AgregarZelleWidget> {
  late AgregarZelleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgregarZelleModel());

    _model.emailAddressController ??= TextEditingController();
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
      height: 153.3,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 20, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              controller: _model.emailAddressController,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.emailAddressController',
                Duration(milliseconds: 1000),
                () => setState(() {}),
              ),
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF57636C),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                hintText: 'Email de Zelle',
                hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF57636C),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF1D2429),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
              maxLines: null,
              validator:
                  _model.emailAddressControllerValidator.asValidator(context),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: FFButtonWidget(
                onPressed: /* NOT RECOMMENDED */ _model
                            .emailAddressController.text ==
                        'true'
                    ? null
                    : () async {
                        final medicosUpdateData = createMedicosRecordData(
                          cuentaZelle: createZelleStruct(
                            nombre: currentUserDisplayName,
                            correo: _model.emailAddressController.text,
                            clearUnsetFields: false,
                          ),
                        );
                        await widget.medico!.update(medicosUpdateData);
                        Navigator.pop(context);
                      },
                text: 'Guardar',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).secondaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
    );
  }
}
