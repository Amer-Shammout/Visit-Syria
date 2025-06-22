import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';
import 'package:visit_syria/Core/widgets/custom_selector_image.dart';
import 'package:visit_syria/Core/widgets/details_views_header.dart';
import 'package:visit_syria/Core/widgets/details_views_title.dart';

class ImageSelector extends StatefulWidget {
  const ImageSelector({
    super.key,
    required this.images,
    required this.title,
    this.hasActionButton = true,
  });
  final List<String> images;
  final String title;
  final bool hasActionButton;

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  int _currentIndex = 0;
  late String _currentImage;
  @override
  void initState() {
    _currentImage = widget.images[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
      child: Column(
        children: [
          Stack(
            children: [
              CustomImage(height: 324, borderRadius: 24, image: _currentImage),
              Positioned(
                right: 16,
                left: 16,
                top: 16,
                child: DetailsViewsHeader(
                  hasActionButton: widget.hasActionButton,
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: DetailsViewsTitle(title: widget.title),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.s12),
          widget.images.length == 1
              ? SizedBox.shrink()
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(widget.images.length, (index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: index != widget.images.length - 1 ? 8 : 0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                          _currentImage = widget.images[index];
                        });
                      },
                      child: CustomSelectorImage(
                        isSelected: _currentIndex == index,
                        image: widget.images[index],
                      ),
                    ),
                  );
                }),
              ),
        ],
      ),
    );
  }
}
