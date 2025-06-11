import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/widgets/custom_icon_button.dart';
import 'package:visit_syria/Core/utils/widgets/custom_image.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card_details.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/ribbon_label.dart';

class PlacesCard extends StatelessWidget {
  const PlacesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: AspectRatio(
        aspectRatio: 170 / 220,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomImage(height: 220, borderRadius: 24),
            PositionedDirectional(
              end: 12,
              top: 12,
              child: CustomIconButton(
                inActiveIcon: Assets.iconsBookmarkStroke,
                onTap: () {},
                isActive: false,
                activeIcon: Assets.iconsBookmarkFill,
              ),
            ),
            PositionedDirectional(
              top: 0,
              start: 24,
              child: RibbonLabel(text: '#1'),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: PlacesCardDetails(),
            ),
          ],
        ),
      ),
    );
  }
}
