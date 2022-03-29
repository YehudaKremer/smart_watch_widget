import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabayImageResult.dart';
import 'package:smart_watch_widget/widgets/pixabay/pixabayImageViewer.dart';

class PixabayImageItem extends StatefulWidget {
  final PixabayImage image;
  final void Function(String imageUrl) onSelectImage;

  const PixabayImageItem({
    Key? key,
    required this.image,
    required this.onSelectImage,
  }) : super(key: key);

  @override
  State<PixabayImageItem> createState() => PixabayImageItemState();
}

class PixabayImageItemState extends State<PixabayImageItem>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    setAnimation();
  }

  void setAnimation() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 75), vsync: this);
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween<double>(begin: 0.9, end: 1).animate(curve);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            FluentPageRoute(
                builder: (context) => PixabayImageViewer(
                      image: widget.image,
                      onSelectImage: widget.onSelectImage,
                    )));
      },
      child: MouseRegion(
        onEnter: (_) => controller.forward(),
        onExit: (_) => controller.reverse(),
        child: AnimatedBuilder(
          animation: animation,
          builder: (_, __) => CachedNetworkImage(
            imageUrl: widget.image.webformatURL?.replaceFirst('_640', '_180') ??
                'https://pixabay.com/static/img/logo_square.png',
            placeholder: (context, url) => Center(child: ProgressRing()),
            fit: BoxFit.cover,
            color: Colors.white.withOpacity(animation.value),
            colorBlendMode: BlendMode.modulate,
            errorWidget: (context, url, error) => Icon(FluentIcons.error),
          ),
        ),
      ),
    );
  }
}
