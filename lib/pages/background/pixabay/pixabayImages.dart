import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/pages/background/pixabay/pixabayApiState.dart';
import 'package:smart_watch_widget/pages/background/pixabay/pixabayImageResult.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';
import 'package:smart_watch_widget/utils/navigator.dart';

class PixabayImages extends StatefulWidget {
  final String category;

  PixabayImages({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<PixabayImages> createState() => _PixabayImagesState();
}

class _PixabayImagesState extends State<PixabayImages> {
  List<PixabayImage>? images;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  Future<void> getImages() async {
    var result = await context
        .read<PixabayApiState>()
        .api
        .get('/', queryParameters: {'category': widget.category});
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
                        onPressed: () => navigatorPop(context),
                      )
                    ].cast<Widget>() +
                    (images != null && images!.length > 0
                        ? images!
                            .map((image) => CachedNetworkImage(
                                  imageUrl: image.webformatURL ??
                                      'https://pixabay.com/static/img/logo_square.png',
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
