import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/background/background_image_item.dart';
import 'package:smart_watch_widget/pages/background/background_item.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_categories.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/watch_menu_item.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:smart_watch_widget/widgets/waves.dart';
import 'package:window_manager/window_manager.dart';

class BackgroundPage extends StatefulWidget {
  const BackgroundPage({Key? key}) : super(key: key);

  @override
  State<BackgroundPage> createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
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
          BackgroundItem(
            name: 'Waves',
            background: const Waves(),
            isSelected:
                context.watch<AppState>().backgroundType == Background.waves,
            onPressed: () {
              context.read<AppState>().setBackground(Background.waves);
            },
          ),
          BackgroundImageItem(
            name: 'Local\nImage',
            backgroundType: Background.localImage,
            onPressed: () async {
              FilePickerResult? result =
                  await FilePicker.platform.pickFiles(type: FileType.image);

              if (result != null) {
                var path = result.files.single.path;
                if (path != null && path.isNotEmpty) {
                  if (!mounted) return;
                  context
                      .read<AppState>()
                      .setBackground(Background.localImage, localImage: path);
                }
              }
            },
          ),
          BackgroundImageItem(
            name: 'Online\nImage',
            backgroundType: Background.onlineImage,
            onPressed: () async {
              Navigator.push(
                  context,
                  FluentPageRoute(
                      builder: (_) => PixabayCategories(
                            onSelectImage: (image) async {
                              var imageUrl = image.webformatURL ?? '';
                              if (imageUrl.isNotEmpty) {
                                var localPath =
                                    '${(await getApplicationDocumentsDirectory()).path}/SmartWatchWidget/Wallpapers/${Uri.parse(imageUrl).pathSegments.last}';
                                await Dio().download(imageUrl, localPath);

                                if (!mounted) return;
                                context.read<AppState>().setBackground(
                                    Background.onlineImage,
                                    onlineImage: localPath);
                              }
                            },
                            onDismiss: () async {
                              final windowPosition =
                                  context.read<AppState>().windowPosition;
                              final watchSize =
                                  context.read<AppState>().watchSize;

                              await windowManager.setBounds(Rect.fromLTWH(
                                  windowPosition.dx,
                                  windowPosition.dy,
                                  watchSize,
                                  watchSize));

                              if (!mounted) return;
                              navigatorPop(context);
                            },
                          )));
            },
          ),
          BackgroundItem(
            name: 'Empty',
            background: Icon(
              FluentIcons.blocked,
              size: 50,
              color: FluentTheme.of(context)
                  .typography
                  .body!
                  .color!
                  .withOpacity(0.2),
            ),
            isSelected:
                context.watch<AppState>().backgroundType == Background.empty,
            onPressed: () {
              context.read<AppState>().setBackground(Background.empty);
            },
          ),
        ],
      ),
    );
  }
}
