import 'package:dio/dio.dart';

class ApiClient {
  static final ApiClient client = ApiClient();

  final Dio _clientDio =
      Dio(BaseOptions(baseUrl: 'https://64e75192b0fd9648b78fc3d2.mockapi.io/'));

  get dio => _clientDio;

  RequestOptions settingOptions(String method, String path,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? extra,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      int? receiveTimeout}) {
    Map<String, dynamic> _extra = extra ?? {};
    final Map<String, dynamic> _queryParameters = queryParameters ?? {};
    final Map<String, dynamic> _headers = headers ?? {};
    final Map<String, dynamic> _data = data ?? {};

    try {
      throw "get StackTrace";
    } catch (e, s) {
      List<String> stackTrace = s.toString().split("\n");
      if (stackTrace.length >= 2) {
        String apiName = stackTrace[1].split(" (").first.split(".").last;
        _extra.addAll({"name": "${apiName.trim()}"});
      }
    }

    return Options(
            method: method,
            headers: _headers,
            extra: _extra,
            receiveTimeout: _clientDio.options.receiveTimeout)
        .compose(_clientDio.options, path,
            queryParameters: _queryParameters, data: _data)
        .copyWith(baseUrl: _clientDio.options.baseUrl);
  }

  RequestOptions setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
