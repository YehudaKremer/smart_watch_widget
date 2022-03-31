import 'package:dio/dio.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_categories.dart';
import 'package:win32/win32.dart';
import 'package:window_manager/window_manager.dart';
import 'menu_item.dart';

class WallpaperMenuItem extends StatefulWidget {
  const WallpaperMenuItem({Key? key}) : super(key: key);

  @override
  State<WallpaperMenuItem> createState() => _WallpaperMenuItemState();
}

class _WallpaperMenuItemState extends State<WallpaperMenuItem> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MenuItem(
          title: 'Desktop Wallpaper',
          icon: FluentIcons.picture_fill,
          onPressed: () => Navigator.push(
              context,
              FluentPageRoute(
                  builder: (_) => PixabayCategories(
                        onSelectImage: (image) async {
                          var imageUrl =
                              image.fullHDURL ?? image.largeImageURL ?? '';
                          if (imageUrl.isNotEmpty) {
                            setState(() => isLoading = true);
                            var localPath =
                                '${(await getApplicationDocumentsDirectory()).path}/SmartWatchWidget/Wallpapers/${Uri.parse(imageUrl).pathSegments.last}';
                            await Dio().download(imageUrl, localPath);
                            LPWSTR path = TEXT(localPath);
                            SystemParametersInfo(
                                SPI_SETDESKWALLPAPER, 0, path, 0);
                            free(path);
                            setState(() => isLoading = false);
                          }
                        },
                        onDismiss: () async {
                          final windowPosition =
                              context.read<AppState>().windowPosition;
                          final watchSize = context.read<AppState>().watchSize;

                          await windowManager.setBounds(Rect.fromLTWH(
                              windowPosition.dx,
                              windowPosition.dy,
                              watchSize,
                              watchSize));

                          navigatorPop(context);
                        },
                      ))),
        ),
        if (isLoading)
          const Center(
              child: SizedBox(
            width: 20,
            height: 20,
            child: ProgressRing(strokeWidth: 4),
          )),
      ],
    );
  }
}
