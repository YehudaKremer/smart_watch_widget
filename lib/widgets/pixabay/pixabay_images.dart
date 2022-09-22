import 'package:dio/dio.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/widgets/pixabay/by_pixabay.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_api_state.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_image_item.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_image_result.dart';
import 'package:smart_watch_widget/pages/menu/watch_menu_item.dart';
import 'package:smart_watch_widget/utils/custom_scroll_behavior.dart';
import 'package:smart_watch_widget/utils/navigator.dart';

class PixabayImages extends StatefulWidget {
  final String category;
  final void Function(PixabayImage image) onSelectImage;

  const PixabayImages({
    Key? key,
    required this.category,
    required this.onSelectImage,
  }) : super(key: key);

  @override
  State<PixabayImages> createState() => _PixabayImagesState();
}

class _PixabayImagesState extends State<PixabayImages> {
  List<PixabayImage>? images;
  bool noInternet = false;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  Future<void> getImages() async {
    try {
      var result = await context
          .read<PixabayApiState>()
          .api
          .get('/', queryParameters: {'category': widget.category});
      var imageResult = PixabayImageResult.fromJson(result.data);
      if (mounted) {
        setState(() {
          images = imageResult.hits;
          if (noInternet) {
            noInternet = false;
          }
        });
      }
    } on DioError catch (e) {
      if (e.message.contains('Failed host lookup')) {
        if (mounted) {
          setState(() {
            noInternet = true;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool haveImages = images != null && images!.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              child: ScrollConfiguration(
                behavior: CustomScrollBehavior(),
                child: Stack(
                  children: [
                    GridView.count(
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                      primary: false,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      crossAxisCount: 3,
                      children: [
                            WatchMenuItem(
                              title: 'Go Back',
                              icon: FluentIcons.back,
                              onPressed: () => navigatorPop(context),
                            )
                          ].cast<Widget>() +
                          (haveImages
                              ? images!
                                  .map((image) => PixabayImageItem(
                                        image: image,
                                        onSelectImage: widget.onSelectImage,
                                      ))
                                  .toList()
                              : []),
                    ),
                    if (haveImages) const ByPixabay(),
                    if (noInternet)
                      const Center(child: Text('No Internet Connection.')),
                    if (images == null || images!.isEmpty)
                      const Center(child: ProgressRing())
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
