import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PixabayCacheInterceptor extends Interceptor {
  SharedPreferences prefs;

  PixabayCacheInterceptor(this.prefs);

  Future<String?> getApiCache(String cacheKey) async {
    //await prefs.remove(cacheKey);
    var cache = prefs.getStringList(cacheKey);
    if (cache != null && cache.isNotEmpty && cache.length > 1) {
      if (DateTime.parse(cache[0])
          .add(const Duration(days: 1))
          .isAfter(DateTime.now())) {
        return cache[1];
      }
    }
    await prefs.remove(cacheKey);
    return null;
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var responseFromCache = await getApiCache(options.uri.toString());
    if (options.extra['refresh'] == true) {
      return handler.next(options);
    } else if (responseFromCache != null) {
      return handler.resolve(Response(
          data: jsonDecode(responseFromCache), requestOptions: options));
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    prefs.setStringList(response.requestOptions.uri.toString(),
        [DateTime.now().toString(), response.toString()]);
    super.onResponse(response, handler);
  }
}
