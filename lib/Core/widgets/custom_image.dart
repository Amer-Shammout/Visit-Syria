import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.height,
    required this.borderRadius,
    this.image,
    this.isAsset = false,
  });

  final double height;
  final double borderRadius;
  final String? image;
  final bool isAsset;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInCubic,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [Shadows.commonShadow],
        image: DecorationImage(
          image:
              isAsset ? AssetImage(image!) : CachedNetworkImageProvider(image!),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),

        gradient: LinearGradient(
          begin: Alignment(0.50, -0.00),
          end: Alignment(0.50, 1.00),
          colors: [
            Colors.black.withValues(alpha: .01),
            Colors.black.withValues(alpha: .03),
            Colors.black.withValues(alpha: .07),
            Colors.black.withValues(alpha: .13),
            Colors.black.withValues(alpha: .20),
            Colors.black.withValues(alpha: .28),
            Colors.black.withValues(alpha: .38),
            Colors.black.withValues(alpha: .47),
            Colors.black.withValues(alpha: .57),
            Colors.black.withValues(alpha: .65),
            Colors.black.withValues(alpha: .72),
            Colors.black.withValues(alpha: .78),
            Colors.black.withValues(alpha: .82),
            Colors.black.withValues(alpha: .84),
            Colors.black.withValues(alpha: .85),
          ],
        ),
      ),
    );
  }
}
