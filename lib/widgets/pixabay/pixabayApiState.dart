import 'package:dio/dio.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabayCacheInterceptor.dart';

class PixabayApiState extends ChangeNotifier {
  final SharedPreferences _prefs;
  late Dio _api;
  Dio get api => _api;

  PixabayApiState(this._prefs) {
    _initApi();
  }

  _initApi() {
    var options = BaseOptions(
      baseUrl: 'https://pixabay.com/api',
      queryParameters: {
        'key': '26185412-c8e36afcd8117b764f7e76eec',
        'min_width': 250,
        'min_height': 250,
        'per_page': 200,
        'safesearch': true,
      },
    );

    _api = Dio(options);
    _api.interceptors.add(PixabayCacheInterceptor(_prefs));
  }
}
