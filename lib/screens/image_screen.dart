import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String? image;
  const ImageScreen({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: CachedNetworkImage(
        imageUrl: image!,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
