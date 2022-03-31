import 'package:fluent_ui/fluent_ui.dart';
import 'package:provider/provider.dart';
import 'package:smart_watch_widget/app_state.dart';
import 'package:smart_watch_widget/widgets/pixabay/by_pixabay.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_category.dart';
import 'package:smart_watch_widget/pages/menu/menu_item.dart';
import 'package:smart_watch_widget/utils/animations.dart';
import 'package:smart_watch_widget/utils/custom_scroll_behavior.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_image_result.dart';
import 'package:win32/win32.dart';
import 'package:window_manager/window_manager.dart';

const photosCategories = [
  'backgrounds',
  'nature',
  'science',
  'education',
  'health',
  'places',
  'animals',
  'industry',
  'computer',
  'food',
  'transportation',
  'buildings',
  'business',
  'music',
];

class PixabayCategories extends StatefulWidget {
  final void Function() onDismiss;
  final void Function(PixabayImage image) onSelectImage;

  const PixabayCategories({
    Key? key,
    required this.onDismiss,
    required this.onSelectImage,
  }) : super(key: key);

  @override
  State<PixabayCategories> createState() => _PixabayCategoriesState();
}

class _PixabayCategoriesState extends State<PixabayCategories> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    resizeWindowToMinimalSize();
  }

  void resizeWindowToMinimalSize() {
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Future.delayed(const Duration(milliseconds: 200), () async {
              final windowPosition = context.read<AppState>().windowPosition;
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
              setState(() => show = true);
            }));
  }

  @override
  Widget build(BuildContext context) {
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
              child: AnimatedSlideFade(
                child: show
                    ? Stack(
                        children: [
                          ScrollConfiguration(
                            behavior: CustomScrollBehavior(),
                            child: GridView.count(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0),
                              primary: false,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              crossAxisCount: 3,
                              children: [
                                    MenuItem(
                                      title: 'Go Back',
                                      icon: FluentIcons.back,
                                      onPressed: () {
                                        setState(() => show = false);
                                        Future.delayed(
                                            const Duration(milliseconds: 200),
                                            () {
                                          widget.onDismiss();
                                        });
                                      },
                                    )
                                  ].cast<Widget>() +
                                  (photosCategories
                                      .map((category) => PixabayCategory(
                                            category: category,
                                            onSelectImage: widget.onSelectImage,
                                          ))
                                      .toList()),
                            ),
                          ),
                          const ByPixabay(),
                        ],
                      )
                    : Container(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
