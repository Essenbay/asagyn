import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/services/network/network_service.dart';

class ServerImage extends StatelessWidget {
  const ServerImage(
      {super.key,
      required this.imageUrl,
      this.fit,
      this.borderRadius,
      this.alignment,
      this.height,
      this.width});
  final String? imageUrl;
  final BoxFit? fit;
  final double? borderRadius;
  final Alignment? alignment;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final url = '$baseUrl$imageUrl';

    if (imageUrl == null) {
      return ColoredBox(color: AppColors.grey300);
    }

    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => const ColoredBox(color: AppColors.grey400),
      errorWidget: (context, url, error) => Container(
        child: const Icon(Icons.error),
      ),
    );
  }
}
