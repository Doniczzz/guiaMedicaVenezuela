import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  GuiaMedicaVenezuelaFirebaseUser? initialUser;
  GuiaMedicaVenezuelaFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(GuiaMedicaVenezuelaFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? HomeWidget() : EntryWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : EntryWidget(),
          routes: [
            FFRoute(
              name: 'entry',
              path: 'entry',
              builder: (context, params) => EntryWidget(),
            ),
            FFRoute(
              name: 'login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'registro',
              path: 'registro',
              builder: (context, params) => RegistroWidget(
                tieneEstado: params.getParam('tieneEstado', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'listaEstados',
              path: 'listaEstados',
              builder: (context, params) => ListaEstadosWidget(
                editandoPerfil:
                    params.getParam('editandoPerfil', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'citasCreadas',
              path: 'citasCreadas',
              builder: (context, params) => CitasCreadasWidget(
                medico: params.getParam('medico', ParamType.DocumentReference,
                    false, ['users', 'medicos']),
              ),
            ),
            FFRoute(
              name: 'listaCiudades',
              path: 'listaCiudades',
              builder: (context, params) => ListaCiudadesWidget(
                estado: params.getParam(
                    'estado', ParamType.DocumentReference, false, ['estados']),
                editandoPerfil:
                    params.getParam('editandoPerfil', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'crearCita',
              path: 'crearCita',
              builder: (context, params) => CrearCitaWidget(
                citaLista: params.getParam<DateTime>(
                    'citaLista', ParamType.DateTime, true),
                medico: params.getParam('medico', ParamType.DocumentReference,
                    false, ['users', 'medicos']),
              ),
            ),
            FFRoute(
              name: 'pacientes',
              path: 'pacientes',
              asyncParams: {
                'cita': getDoc(['citas'], CitasRecord.serializer),
              },
              builder: (context, params) => PacientesWidget(
                cita: params.getParam('cita', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'citasCaducadas',
              path: 'citasCaducadas',
              builder: (context, params) => CitasCaducadasWidget(
                medico: params.getParam('medico', ParamType.DocumentReference,
                    false, ['users', 'medicos']),
              ),
            ),
            FFRoute(
              name: 'buscarEspecialidades',
              path: 'buscarEspecialidades',
              builder: (context, params) => BuscarEspecialidadesWidget(),
            ),
            FFRoute(
              name: 'home',
              path: 'home',
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'buscarMedicos',
              path: 'buscarMedicos',
              asyncParams: {
                'ciudad':
                    getDoc(['estados', 'ciudades'], CiudadesRecord.serializer),
              },
              builder: (context, params) => BuscarMedicosWidget(
                ciudad: params.getParam('ciudad', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'medico',
              path: 'medico',
              builder: (context, params) => MedicoWidget(
                medico: params.getParam('medico', ParamType.DocumentReference,
                    false, ['users', 'medicos']),
              ),
            ),
            FFRoute(
              name: 'sucess',
              path: 'sucess',
              builder: (context, params) => SucessWidget(
                numeroPaciente:
                    params.getParam('numeroPaciente', ParamType.int),
                especialidad: params.getParam('especialidad', ParamType.String),
                medicoNombre: params.getParam('medicoNombre', ParamType.String),
                nReferencia: params.getParam('nReferencia', ParamType.String),
                status: params.getParam('status', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'citaCliente',
              path: 'citaCliente',
              builder: (context, params) => CitaClienteWidget(
                medico: params.getParam('medico', ParamType.DocumentReference,
                    false, ['users', 'medicos']),
                cita: params.getParam(
                    'cita', ParamType.DocumentReference, false, ['citas']),
              ),
            ),
            FFRoute(
              name: 'misCitas',
              path: 'misCitas',
              builder: (context, params) => MisCitasWidget(),
            ),
            FFRoute(
              name: 'estados',
              path: 'estados',
              builder: (context, params) => EstadosWidget(),
            ),
            FFRoute(
              name: 'pacienteBuscado',
              path: 'pacienteBuscado',
              builder: (context, params) => PacienteBuscadoWidget(
                cita: params.getParam(
                    'cita', ParamType.DocumentReference, false, ['citas']),
                nReferencia: params.getParam('nReferencia', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ciudades',
              path: 'ciudades',
              builder: (context, params) => CiudadesWidget(
                estado: params.getParam(
                    'estado', ParamType.DocumentReference, false, ['estados']),
              ),
            ),
            FFRoute(
              name: 'notificaciones',
              path: 'notificaciones',
              builder: (context, params) => NotificacionesWidget(),
            ),
            FFRoute(
              name: 'miCuenta',
              path: 'miCuenta',
              builder: (context, params) => MiCuentaWidget(),
            ),
            FFRoute(
              name: 'seleccionarEspecialidad',
              path: 'seleccionarEspecialidad',
              asyncParams: {
                'medico':
                    getDoc(['users', 'medicos'], MedicosRecord.serializer),
              },
              builder: (context, params) => SeleccionarEspecialidadWidget(
                medico: params.getParam('medico', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'crearMedico',
              path: 'crearMedico',
              asyncParams: {
                'medico':
                    getDoc(['users', 'medicos'], MedicosRecord.serializer),
              },
              builder: (context, params) => CrearMedicoWidget(
                medico: params.getParam('medico', ParamType.Document),
                listEspecialidades: params.getParam<String>(
                    'listEspecialidades', ParamType.String, true),
              ),
            ),
            FFRoute(
              name: 'buscarMedicosEspecialidad',
              path: 'buscarMedicosEspecialidad',
              asyncParams: {
                'especialidad':
                    getDoc(['especialidades'], EspecialidadesRecord.serializer),
              },
              builder: (context, params) => BuscarMedicosEspecialidadWidget(
                especialidad:
                    params.getParam('especialidad', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'editarMedico',
              path: 'editarMedico',
              asyncParams: {
                'medico':
                    getDoc(['users', 'medicos'], MedicosRecord.serializer),
              },
              builder: (context, params) => EditarMedicoWidget(
                medico: params.getParam('medico', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'cambiarEstadoMed',
              path: 'cambiarEstadoMed',
              asyncParams: {
                'medico':
                    getDoc(['users', 'medicos'], MedicosRecord.serializer),
              },
              builder: (context, params) => CambiarEstadoMedWidget(
                medico: params.getParam('medico', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'cambiarCiudadMed',
              path: 'cambiarCiudadMed',
              asyncParams: {
                'medico':
                    getDoc(['users', 'medicos'], MedicosRecord.serializer),
              },
              builder: (context, params) => CambiarCiudadMedWidget(
                estado: params.getParam(
                    'estado', ParamType.DocumentReference, false, ['estados']),
                medico: params.getParam('medico', ParamType.Document),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/entry';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  child: Image.asset(
                    'assets/images/splashfinal.png',
                    fit: BoxFit.contain,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
