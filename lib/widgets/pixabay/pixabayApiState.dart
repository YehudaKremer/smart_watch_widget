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
      baseUrl: 'https://smart-watch-widget-api.vercel.app/api/pixabay',
    );

    _api = Dio(options);
    _api.interceptors.add(PixabayCacheInterceptor(_prefs));
  }
}
