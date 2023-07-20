import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:media_probe_app/core/ui/style/global_colors.dart';

// TODO: CachedNetwork Image Kullanılacak

class CircularImageWidget extends StatelessWidget {
  final String? imageUrl;
  const CircularImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(36.r),
      child: imageUrl.getValueOrDefault.isNotEmpty
          ? Image.network(imageUrl.getValueOrDefault,
              errorBuilder: (context, error, stackTrace) => Container(
                    width: 72.w,
                    height: 72.w,
                    color: context.grey,
                    child: Icon(
                      Icons.image_not_supported_rounded,
                      color: context.white,
                    ),
                  ))
          : Container(
              width: 72.w,
              height: 72.w,
              color: context.grey,
              child: Icon(
                Icons.image_not_supported_rounded,
                color: context.white,
              ),
            ),
    );
  }
}
