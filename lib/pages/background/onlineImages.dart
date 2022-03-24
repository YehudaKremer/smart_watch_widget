import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:smart_watch_widget/pages/home/layout.dart';

class OnlineImages extends StatelessWidget {
  const OnlineImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: CachedNetworkImage(
        imageUrl:
            'https://cdn.pixabay.com/photo/2020/09/26/07/05/sea-5603351_960_720.jpg',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            ProgressRing(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(FluentIcons.error),
      ),
    );
  }
}
