import 'package:dio/dio.dart';
import 'dart:ui' as ui;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/watch_menu_item.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:win32/win32.dart';
import 'package:window_manager/window_manager.dart';

import '../../widgets/pixabay/pixabay_categories.dart';
import '../watchBackground/background_image_item.dart';
import '../watchBackground/watch_background_menu.dart';

class WallpaperMenu extends StatefulWidget {
  const WallpaperMenu({Key? key}) : super(key: key);

  @override
  State<WallpaperMenu> createState() => _WallpaperMenuState();
}

class _WallpaperMenuState extends State<WallpaperMenu> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GridView.count(
        padding: EdgeInsets.all(context.read<AppState>().watchSize / 8),
        primary: false,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: [
          WatchMenuItem(
            title: 'Go Back',
            icon: FluentIcons.back,
            onPressed: () => navigatorPop(context),
          ),
          BackgroundImageItem(
            name: 'Watch Wallpaper',
            backgroundType: Background.localImage,
            backgroundImagePath:
                context.watch<AppState>().brightness == Brightness.dark
                    ? 'assets/images/watch_dark.png'
                    : 'assets/images/watch_light.png',
            nameTextStyle: FluentTheme.of(context).typography.caption,
            onPressed: () => Navigator.push(
                context,
                FluentPageRoute(
                  builder: (context) => const BackgroundPage(),
                  settings: const RouteSettings(name: 'BackgroundPage'),
                )),
          ),
          BackgroundImageItem(
            name: 'Desktop Wallpaper',
            backgroundType: Background.localImage,
            backgroundImagePath:
                context.watch<AppState>().brightness == Brightness.dark
                    ? 'assets/images/desktop_dark.png'
                    : 'assets/images/desktop_light.png',
            nameTextStyle: FluentTheme.of(context).typography.caption,
            onPressed: () => Navigator.push(
                context,
                FluentPageRoute(
                  builder: (_) => PixabayCategories(
                    onSelectImage: (image) async {
                      var imageUrl =
                          image.fullHDURL ?? image.largeImageURL ?? '';
                      if (imageUrl.isNotEmpty) {
                        var localPath =
                            '${(await getApplicationDocumentsDirectory()).path}/SmartWatchWidget/Wallpapers/${Uri.parse(imageUrl).pathSegments.last}';
                        await Dio().download(imageUrl, localPath);
                        LPWSTR path = TEXT(localPath);
                        SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, path, 0);
                        free(path);
                      }
                    },
                    onDismiss: () async {
                      final windowPosition =
                          context.read<AppState>().windowPosition;
                      final watchSize = context.read<AppState>().watchSize;

                      await windowManager.setBounds(ui.Rect.fromLTWH(
                          windowPosition.dx,
                          windowPosition.dy,
                          watchSize,
                          watchSize));

                      if (!mounted) return;
                      navigatorPop(context);
                    },
                  ),
                  settings: const RouteSettings(name: 'PixabayCategories'),
                )),
          ),
        ],
      ),
    );
  }
}
