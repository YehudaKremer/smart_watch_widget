import 'package:fluent_ui/fluent_ui.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_image_result.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabay_images.dart';

class PixabayCategory extends StatefulWidget {
  final String category;
  final void Function(PixabayImage image) onSelectImage;

  const PixabayCategory({
    Key? key,
    required this.category,
    required this.onSelectImage,
  }) : super(key: key);

  @override
  State<PixabayCategory> createState() => _PixabayCategoryState();
}

class _PixabayCategoryState extends State<PixabayCategory>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    setAnimation();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  void setAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 75), vsync: this);
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween<double>(begin: 0.8, end: 0.9).animate(curve);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            FluentPageRoute(
              builder: (context) => PixabayImages(
                category: widget.category,
                onSelectImage: widget.onSelectImage,
              ),
              settings: const RouteSettings(name: 'PixabayImages'),
            ));
      },
      child: MouseRegion(
        onEnter: (_) => controller.forward(),
        onExit: (_) => controller.reverse(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (_, __) => Image(
                image: AssetImage('assets/images/${widget.category}.jpg'),
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(animation.value),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Center(
              child: SizedBox(
                width: 120,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${widget.category.toUpperCase().substring(0, 1)}${widget.category.substring(1)}',
                    style: FluentTheme.of(context)
                        .typography
                        .bodyLarge!
                        .copyWith(color: Colors.white.withOpacity(0.9)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
