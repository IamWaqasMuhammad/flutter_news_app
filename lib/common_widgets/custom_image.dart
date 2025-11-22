
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../app_barrels.dart';

class CustomImage extends StatelessWidget {
  final String path; // local asset path or network URL
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BaseCacheManager? cacheManager; // optional custom cache manager

  const CustomImage({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.errorWidget,
    this.cacheManager,
  }) : super(key: key);

  bool get _isNetwork => path.startsWith('http://') || path.startsWith('https://');
  bool get _isSvg => path.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    // NETWORK IMAGES
    if (_isNetwork) {
      if (_isSvg) {
        return SvgPicture.network(
          path,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (_) => placeholder ?? const LoadingSpinner(),
        );
      } else {
        return CachedNetworkImage(
          imageUrl: path,
          width: width,
          height: height,
          fit: fit,
          cacheManager: cacheManager,
          placeholder: (context, url) => placeholder ?? const CircularProgressIndicator(),
          errorWidget: (context, url, error) => errorWidget ?? const Icon(Icons.error),
        );
      }
    }
    // LOCAL ASSETS
    else {
      if (_isSvg) {
        return SvgPicture.asset(
          path,
          width: width,
          height: height,
          fit: fit,
        );
      } else {
        return Image.asset(
          path,
          width: width,
          height: height,
          fit: fit,
        );
      }
    }
  }
}
