import '../components/mindscode_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'entry_model.dart';
export 'entry_model.dart';

class EntryWidget extends StatefulWidget {
  const EntryWidget({Key? key}) : super(key: key);

  @override
  _EntryWidgetState createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget>
    with TickerProviderStateMixin {
  late EntryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'columnOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 1050.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, -100),
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 220.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
    'lottieAnimationOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'imageOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(0, -100),
          end: Offset(0, 0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      backgroundColor: FlutterFlowTheme.of(context).gray200,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 850),
            curve: Curves.easeIn,
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientText(
                              'Bienvenido/a',
                              style: FlutterFlowTheme.of(context)
                                  .title1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).fondoMenu,
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                              colors: [
                                FlutterFlowTheme.of(context).fondoMenu,
                                FlutterFlowTheme.of(context).secondaryColor
                              ],
                              gradientDirection: GradientDirection.ltr,
                              gradientType: GradientType.linear,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(
                                    'login',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                text: 'Buscar Medicos',
                                icon: FaIcon(
                                  FontAwesomeIcons.mapMarkerAlt,
                                ),
                                options: FFButtonOptions(
                                  height: 40,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'DM Sans',
                                        color: Color(0xFF151515),
                                      ),
                                  elevation: 5,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'buttonOnActionTriggerAnimation']!,
                              ),
                            ),
                          ],
                        )
                            .animateOnPageLoad(
                                animationsMap['columnOnPageLoadAnimation2']!)
                            .animateOnActionTrigger(
                              animationsMap['columnOnActionTriggerAnimation']!,
                            ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Lottie.asset(
                          'assets/lottie_animations/backgrtound.json',
                          width: 350,
                          height: 350,
                          fit: BoxFit.none,
                          animate: true,
                        ).animateOnPageLoad(animationsMap[
                            'lottieAnimationOnPageLoadAnimation']!),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Image.asset(
                          'assets/images/paranetry.png',
                          width: 300,
                          fit: BoxFit.contain,
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation1']!),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Image.asset(
                    'assets/images/letrasnetry.png',
                    width: double.infinity,
                    height: 100,
                    fit: BoxFit.contain,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation2']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 25),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Container(
                      width: 280.5,
                      height: 70.2,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).fondoMenu,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: wrapWithModel(
                            model: _model.mindscodeModel,
                            updateCallback: () => setState(() {}),
                            child: MindscodeWidget(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
