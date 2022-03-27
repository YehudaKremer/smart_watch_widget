import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/pages/background/pixabay/pixabayApiState.dart';
import 'package:smart_watch_widget/pages/background/pixabay/pixabayImageResult.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';
import 'package:smart_watch_widget/utils/navigator.dart';
import 'package:win32/win32.dart';
import 'package:window_manager/window_manager.dart';

const photosCategories = [
  'backgrounds',
  'fashion',
  'nature',
  'science',
  'education',
  'feelings',
  'health',
  'people',
  'religion',
  'places',
  'animals',
  'industry',
  'computer',
  'food',
  'sports',
  'transportation',
  'travel',
  'buildings',
  'business',
  'music'
];

//https://pixabay.com/api/?key=26185412-c8e36afcd8117b764f7e76eec
//https://pixabay.com/api/?key=26185412-c8e36afcd8117b764f7e76eec&min_width=250&min_height=250&safesearch=true&category=nature

class PixabayImages extends StatefulWidget {
  final void Function() onDismiss;

  PixabayImages({Key? key, required this.onDismiss}) : super(key: key);

  @override
  State<PixabayImages> createState() => _PixabayImagesState();
}

class _PixabayImagesState extends State<PixabayImages> {
  List<PixabayImage>? images;

  @override
  void initState() {
    super.initState();
    resizeWindowToMinimalSize();
    getImages();
  }

  void resizeWindowToMinimalSize() {
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Future.delayed(Duration(milliseconds: 200), () async {
              final windowPosition = context.read<AppState>().windowPosition ??
                  await windowManager.getPosition();
              final watchSize = context.read<AppState>().watchSize;
              final height = watchSize >= 450 ? watchSize : 450.0;
              final width =
                  watchSize >= 450 ? watchSize : 450.0; //watchSize + 200.0;
              final screenWidth = GetSystemMetrics(SM_CXSCREEN);
              final screenHeight = GetSystemMetrics(SM_CYSCREEN);

              await windowManager.setBounds(Rect.fromLTWH(
                  windowPosition.dx + width > screenWidth
                      ? screenWidth - width
                      : windowPosition.dx,
                  windowPosition.dy + height > screenHeight
                      ? screenHeight - height
                      : windowPosition.dy,
                  width,
                  height));
            }));
  }

  Future<void> getImages() async {
    var result = await context
        .read<PixabayApiState>()
        .api
        .get('/', queryParameters: {'category': 'nature'});
    var imageResult = PixabayImageResult.fromJson(result.data);
    setState(() {
      images = imageResult.hits;
    });
  }

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
              child: GridView.count(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                primary: false,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 3,
                children: [
                      MenuItem(
                        title: 'Go Back',
                        icon: FluentIcons.back,
                        onPressed: widget.onDismiss,
                      )
                    ].cast<Widget>() +
                    (images != null && images!.length > 0
                        ? images!
                            .map((image) => CachedNetworkImage(
                                  imageUrl: image.previewURL ??
                                      'https://pixabay.com/static/img/logo_square.png',
                                  // progressIndicatorBuilder:
                                  //     (context, url, downloadProgress) => Center(
                                  //         child: ProgressRing(
                                  //             value: downloadProgress.progress)),
                                  placeholder: (context, url) =>
                                      Center(child: ProgressRing()),
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Icon(FluentIcons.error),
                                ))
                            .toList()
                        : []),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
