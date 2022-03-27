import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PixabayCacheInterceptor extends Interceptor {
  SharedPreferences prefs;

  PixabayCacheInterceptor(this.prefs);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var responseFromCache = prefs.getString(options.uri.toString());
    if (options.extra['refresh'] == true) {
      print('${options.uri}: force refresh, ignore cache! \n');
      return handler.next(options);
    } else if (responseFromCache != null) {
      print('cache hit: ${options.uri} \n');
      return handler.resolve(Response(
          data: jsonDecode(responseFromCache), requestOptions: options));
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    prefs.setString(
        response.requestOptions.uri.toString(), response.toString());
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('onError: $err');
    super.onError(err, handler);
  }
}
