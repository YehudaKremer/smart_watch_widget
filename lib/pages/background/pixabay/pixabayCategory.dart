import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart';

class pixabayCategory extends StatefulWidget {
  final String category;
  final String imageUrl;
  pixabayCategory({Key? key, required this.category, required this.imageUrl})
      : super(key: key);

  @override
  State<pixabayCategory> createState() => _pixabayCategoryState();
}

class _pixabayCategoryState extends State<pixabayCategory> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      placeholder: (context, url) => Center(child: ProgressRing()),
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Icon(FluentIcons.error),
    );
  }
}
