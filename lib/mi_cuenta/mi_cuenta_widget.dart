import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/editar_mi_cuenta_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mi_cuenta_model.dart';
export 'mi_cuenta_model.dart';

class MiCuentaWidget extends StatefulWidget {
  const MiCuentaWidget({Key? key}) : super(key: key);

  @override
  _MiCuentaWidgetState createState() => _MiCuentaWidgetState();
}

class _MiCuentaWidgetState extends State<MiCuentaWidget>
    with TickerProviderStateMixin {
  late MiCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiCuentaModel());
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
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
          child: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Color(0xFF5E5E5E),
              size: 30,
            ),
            onPressed: () async {
              context.pushNamed('home');
            },
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AuthUserStreamWidget(
                builder: (context) => InkWell(
                  onTap: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isMediaUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];
                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isMediaUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }

                    final usersUpdateData = createUsersRecordData(
                      photoUrl: _model.uploadedFileUrl,
                    );
                    await currentUserReference!.update(usersUpdateData);
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      valueOrDefault<String>(
                        currentUserPhoto,
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/guia-medica-venezuela-mnxqj1/assets/xij2t4ymf6c9/isotipo2.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: AuthUserStreamWidget(
                  builder: (context) => Text(
                    currentUserDisplayName,
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Text(
                  currentUserEmail,
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'DM Sans',
                        color: FlutterFlowTheme.of(context).secondaryColor,
                      ),
                ),
              ),
              Divider(
                height: 44,
                thickness: 1,
                indent: 24,
                endIndent: 24,
                color: FlutterFlowTheme.of(context).lineColor,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).lineColor,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Icon(
                            Icons.power_settings_new_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: AuthUserStreamWidget(
                            builder: (context) => SwitchListTile.adaptive(
                              value: _model.switchListTileValue ??=
                                  valueOrDefault<bool>(
                                      currentUserDocument?.pushNotification,
                                      false),
                              onChanged: (newValue) async {
                                setState(() =>
                                    _model.switchListTileValue = newValue!);
                                if (newValue!) {
                                  final usersUpdateData = createUsersRecordData(
                                    pushNotification: true,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                } else {
                                  final usersUpdateData = createUsersRecordData(
                                    pushNotification: false,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                }
                              },
                              title: Text(
                                'Recibir Notificaciones',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'DM Sans',
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                              ),
                              tileColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              activeColor:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              activeTrackColor: Color(0x3439D2C0),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.trailing,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 4, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: InkWell(
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: EditarMiCuentaWidget(),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).lineColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Icon(
                              Icons.account_circle_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Editar mis datos',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'DM Sans',
                                    color: FlutterFlowTheme.of(context).gray600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).lineColor,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Icon(
                            Icons.settings_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Opciones de cuenta (En construcción)',
                            style: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: 'DM Sans',
                                  color: FlutterFlowTheme.of(context).gray600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await signOut();

                    context.goNamedAuth('entry', mounted);
                  },
                  text: 'Salir',
                  options: FFButtonOptions(
                    width: 150,
                    height: 44,
                    color: Color(0xFFEC9CA1),
                    textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'DM Sans',
                          color: FlutterFlowTheme.of(context).gray600,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).lineColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(38),
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
