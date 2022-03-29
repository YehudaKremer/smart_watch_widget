import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/pages/background/BackgroundImageItem.dart';
import 'package:smart_watch_widget/pages/background/backgroundItem.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabayCategories.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:smart_watch_widget/widgets/waves.dart';
import 'package:window_manager/window_manager.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({Key? key}) : super(key: key);

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
          MenuItem(
            title: 'Go Back',
            icon: FluentIcons.back,
            onPressed: () => navigatorPop(context),
          ),
          BackgroundItem(
            name: 'Waves',
            background: Waves(),
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
                            onSelectImage: (imageUrl) {
                              context.read<AppState>().setBackground(
                                  Background.onlineImage,
                                  onlineImage: imageUrl);
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
