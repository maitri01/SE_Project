import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class NiftyCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'NIFTY',
      apiUrl: 'https://latest-stock-price.p.rapidapi.com/price',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'f40ef21d0bmsh98428bce74b479ep12f80bjsn3b9d2aa1a891',
        'X-RapidAPI-Host': 'latest-stock-price.p.rapidapi.com',
        'useQueryString': 'true',
      },
      params: {
        'Indices': "NIFTY 50",
        'Identifier': "NIFTY 50",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic niftyprice(dynamic response) => getJsonField(
        response,
        r'''$[0].lastPrice''',
        true,
      );
}

class NasdaqStocksCall {
  static Future<ApiCallResponse> call({
    String? name = 'BDX',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'NASDAQ STOCKS',
      apiUrl: 'https://realstonks.p.rapidapi.com/${name}',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'f40ef21d0bmsh98428bce74b479ep12f80bjsn3b9d2aa1a891',
        'X-RapidAPI-Host': 'realstonks.p.rapidapi.com',
        'useQueryString': 'true',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.price''',
      );
  static dynamic changepoint(dynamic response) => getJsonField(
        response,
        r'''$.change_point''',
      );
  static dynamic changepercentage(dynamic response) => getJsonField(
        response,
        r'''$.change_percentage''',
      );
  static dynamic totalvolume(dynamic response) => getJsonField(
        response,
        r'''$.total_vol''',
      );
}

class TwelveOutCall {
  static Future<ApiCallResponse> call({
    String? symbol = 'AAPL',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'TWELVE OUT',
      apiUrl: 'https://twelve-data1.p.rapidapi.com/price',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'f40ef21d0bmsh98428bce74b479ep12f80bjsn3b9d2aa1a891',
        'X-RapidAPI-Host': 'twelve-data1.p.rapidapi.com',
      },
      params: {
        'symbol': symbol,
        'format': "json",
        'outputsize': 30,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic prices(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class HistoricDataYahooCall {
  static Future<ApiCallResponse> call({
    String? name = 'AAPL',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'HISTORIC DATA YAHOO',
      apiUrl:
          'https://yahoo-finance15.p.rapidapi.com/api/yahoo/hi/history/${name}/1h',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'f40ef21d0bmsh98428bce74b479ep12f80bjsn3b9d2aa1a891',
        'X-RapidAPI-Host': 'yahoo-finance15.p.rapidapi.com',
        'useQueryString': 'true',
      },
      params: {
        'diffandsplits': false,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic close(dynamic response) => getJsonField(
        response,
        r'''$.items..close''',
        true,
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.items..date''',
        true,
      );
  static dynamic open(dynamic response) => getJsonField(
        response,
        r'''$.items..open''',
        true,
      );
  static dynamic dateutc(dynamic response) => getJsonField(
        response,
        r'''$.items..date_utc''',
        true,
      );
}

class AlphaVantageCall {
  static Future<ApiCallResponse> call({
    String? name = 'AAPL',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Alpha Vantage',
      apiUrl: 'https://alpha-vantage.p.rapidapi.com/query',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'f40ef21d0bmsh98428bce74b479ep12f80bjsn3b9d2aa1a891',
        'X-RapidAPI-Host': 'alpha-vantage.p.rapidapi.com',
        'useQueryString': 'true',
      },
      params: {
        'interval': "60min",
        'function': "TIME_SERIES_INTRADAY",
        'symbol': name,
        'datatype': "json",
        'output_size': "compact",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RsiCall {
  static Future<ApiCallResponse> call({
    String? name = 'AAPL',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'RSI',
      apiUrl: 'https://alpha-vantage.p.rapidapi.com/query',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'f40ef21d0bmsh98428bce74b479ep12f80bjsn3b9d2aa1a891',
        'X-RapidAPI-Host': 'alpha-vantage.p.rapidapi.com',
        'useQueryString': 'true',
      },
      params: {
        'interval': "15min",
        'symbol': name,
        'datatype': "json",
        'series_type': "close",
        'time_period': "200",
        'function': "RSI",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic rsi(dynamic response) => getJsonField(
        response,
        r'''$..['RSI']''',
        true,
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
