import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImageWidget extends StatelessWidget {
  final String imageUrl; // URL of the image
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder; // optional placeholder widget
  final Widget? errorWidget; // optional error widget

  const CachedImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
      placeholder ?? const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
      errorWidget ?? const Icon(Icons.error),
    );
  }
}
