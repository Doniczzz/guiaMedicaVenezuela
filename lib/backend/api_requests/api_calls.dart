import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CambioDolarCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'cambioDolar',
      apiUrl: 'https://s3.amazonaws.com/dolartoday/data.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic precio(dynamic response) => getJsonField(
        response,
        r'''$.USD.promedio_real''',
      );
}

class VerificarTelefonoCall {
  static Future<ApiCallResponse> call({
    String? phone = '+584147523942',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'verificar telefono',
      apiUrl: 'https://veriphone.p.rapidapi.com/verify',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '44b01ef0a6msh65986950157ca8ep109066jsn06a616fab3a8',
        'X-RapidAPI-Host': 'veriphone.p.rapidapi.com',
      },
      params: {
        'phone': phone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic verificarNumero(dynamic response) => getJsonField(
        response,
        r'''$.phone_valid''',
      );
  static dynamic numero(dynamic response) => getJsonField(
        response,
        r'''$.e164''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
