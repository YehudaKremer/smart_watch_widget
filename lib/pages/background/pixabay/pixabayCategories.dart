import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/appState.dart';
import 'package:smart_watch_widget/pages/background/pixabay/pixabayApiState.dart';
import 'package:smart_watch_widget/pages/background/pixabay/pixabayCategory.dart';
import 'package:smart_watch_widget/pages/background/pixabay/pixabayImageResult.dart';
import 'package:smart_watch_widget/pages/menu/menuItem.dart';
import 'package:win32/win32.dart';
import 'package:window_manager/window_manager.dart';

const photosCategories = {
  'backgrounds':
      'https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_960_720.jpg',
  'fashion':
      'https://cdn.pixabay.com/photo/2020/07/15/18/26/footwear-5408643_960_720.jpg',
  'nature':
      'https://cdn.pixabay.com/photo/2014/02/27/16/10/tree-276014_960_720.jpg',
  'science':
      'https://cdn.pixabay.com/photo/2017/02/01/13/53/analysis-2030265_960_720.jpg',
  'education':
      'https://cdn.pixabay.com/photo/2016/06/01/06/26/open-book-1428428_960_720.jpg',
  'feelings':
      'https://cdn.pixabay.com/photo/2017/11/26/15/16/smiley-2979107_960_720.jpg',
  'health':
      'https://cdn.pixabay.com/photo/2017/05/25/15/08/jogging-2343558_960_720.jpg',
  'people':
      'https://pixabay.com/photos/people-jumping-happiness-happy-fun-821624/',
  'religion':
      'https://cdn.pixabay.com/photo/2017/04/08/22/26/buddhism-2214532_960_720.jpg',
  'places':
      'https://cdn.pixabay.com/photo/2016/07/30/08/13/moscow-1556561_960_720.jpg',
  'animals':
      'https://cdn.pixabay.com/photo/2017/02/07/16/47/kingfisher-2046453_960_720.jpg',
  'industry':
      'https://cdn.pixabay.com/photo/2020/11/12/16/58/worker-5736096_960_720.jpg',
  'computer':
      'https://cdn.pixabay.com/photo/2016/03/26/13/09/cup-of-coffee-1280537_960_720.jpg',
  'food':
      'https://cdn.pixabay.com/photo/2016/12/26/17/28/spaghetti-1932466_960_720.jpg',
  'sports':
      'https://cdn.pixabay.com/photo/2016/05/09/11/09/tennis-1381230_960_720.jpg',
  'transportation':
      'https://cdn.pixabay.com/photo/2016/11/22/23/44/porsche-1851246_960_720.jpg',
  'travel':
      'https://cdn.pixabay.com/photo/2016/01/19/15/48/luggage-1149289_960_720.jpg',
  'buildings':
      'https://cdn.pixabay.com/photo/2018/02/27/06/30/skyscrapers-3184798_960_720.jpg',
  'business':
      'https://cdn.pixabay.com/photo/2015/01/08/18/27/startup-593341_960_720.jpg',
  'music':
      'https://cdn.pixabay.com/photo/2015/05/07/11/02/guitar-756326_960_720.jpg',
};

class PixabayCategories extends StatefulWidget {
  final void Function() onDismiss;

  PixabayCategories({
    Key? key,
    required this.onDismiss,
  }) : super(key: key);

  @override
  State<PixabayCategories> createState() => _PixabayCategoriesState();
}

class _PixabayCategoriesState extends State<PixabayCategories> {
  @override
  void initState() {
    super.initState();
    resizeWindowToMinimalSize();
  }

  void resizeWindowToMinimalSize() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final windowPosition = context.read<AppState>().windowPosition ??
          await windowManager.getPosition();
      final watchSize = context.read<AppState>().watchSize;
      final height = watchSize >= 450 ? watchSize : 450.0;
      final width = watchSize >= 450 ? watchSize : 450.0;
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
                    (photosCategories.entries
                        .map((e) =>
                            pixabayCategory(category: e.key, imageUrl: e.value))
                        .toList()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
