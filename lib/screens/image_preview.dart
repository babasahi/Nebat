import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewPage extends StatelessWidget {
  const ImagePreviewPage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PhotoView(
          imageProvider: NetworkImage(
        url,
      )),
    );
  }
}
