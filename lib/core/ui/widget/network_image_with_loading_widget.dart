import 'package:flutter/material.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';

class ImageNetworkWithLoadingWidget extends StatelessWidget {
  const ImageNetworkWithLoadingWidget({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl, // Banner resmi burada
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null ? child : const Center(child: CircularProgressIndicator.adaptive());
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: context.grey,
          child: Center(
            child: Icon(Icons.error_outline, color: context.white),
          ),
        );
      },
    );
  }
}
