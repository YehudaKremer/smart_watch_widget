import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabayImageBy.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabayImageResult.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:window_manager/window_manager.dart';

class PixabayImageViewer extends StatefulWidget {
  final PixabayImage image;
  final void Function(String imageUrl) onSelectImage;

  const PixabayImageViewer({
    Key? key,
    required this.image,
    required this.onSelectImage,
  }) : super(key: key);

  @override
  State<PixabayImageViewer> createState() => _PixabayImageViewerState();
}

class _PixabayImageViewerState extends State<PixabayImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: ScaffoldPage(
          padding: const EdgeInsets.all(0),
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.watch<AppState>().isWindowFocused
                    ? FluentTheme.of(context).accentColor
                    : FluentTheme.of(context).shadowColor.withOpacity(0.4),
                width: 1.4,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(9)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.image.largeImageURL ??
                        'https://pixabay.com/static/img/logo_square.png',
                    placeholder: (context, url) =>
                        Center(child: ProgressRing()),
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        Icon(FluentIcons.error),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: IconButton(
                        style: ButtonStyle(
                          iconSize: ButtonState.all(FluentTheme.of(context)
                              .typography
                              .title!
                              .fontSize),
                        ),
                        icon: Icon(
                          FluentIcons.back,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        onPressed: () => navigatorPop(context),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: FilledButton(
                      child: Row(
                        children: [
                          Icon(FluentIcons.save),
                          Container(width: 5),
                          Text('Select Image'),
                        ],
                      ),
                      onPressed: () async {
                        navigatorPop(context);
                        navigatorPop(context);
                        navigatorPop(context);

                        widget.onSelectImage(widget.image.largeImageURL!);

                        final windowPosition =
                            context.read<AppState>().windowPosition;
                        final watchSize = context.read<AppState>().watchSize;

                        await windowManager.setBounds(Rect.fromLTWH(
                            windowPosition.dx,
                            windowPosition.dy,
                            watchSize,
                            watchSize));
                      },
                    ),
                  ),
                  PixabayImageBy(image: widget.image),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
