import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    Key? key,
    required this.imageUrl,
    required this.blurHash,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String imageUrl;
  final String blurHash;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholderFadeInDuration: const Duration(milliseconds: 1000),
      fadeInDuration: const Duration(milliseconds: 1000),
      fit: fit,
      placeholder: (context, url) => BlurHash(
        hash: blurHash,
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        color: Theme.of(context).errorColor,
      ),
    );
  }
}
