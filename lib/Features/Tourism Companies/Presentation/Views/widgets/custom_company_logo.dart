import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

class CustomCompanyLogo extends StatelessWidget {
  const CustomCompanyLogo({super.key, required this.size, this.image});

  final double size;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(360),
      child: CachedNetworkImage(
              imageUrl: image!,
              fit: BoxFit.cover,
              errorWidget:
                  (context, url, error) => Container(
                    color: AppColors.graySwatch,
                    child: Icon(Icons.error, color: Colors.red),
                  ),
            ),
    );
  }
}
