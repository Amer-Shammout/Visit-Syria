import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/drawer_constants.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.whiteColor,
        width: MediaQuery.sizeOf(context).width * .7,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(width: 0),
        ),
        elevation: 25,
        child: Column(
          children: [
            Container(
              height: 168,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesBurgerImage),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Assets.imagesLogoWhite,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: AppSpacing.s32),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: drawerItems.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      height: 20,
                      color: AppColors.graySwatch[300],
                      thickness: 1,
                    ),
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: CustomDrawerItem(
                      drawerModel: drawerItems[index],
                      onTap:
                          () =>
                              index == 2
                                  ? GoRouter.of(context).pushNamed(
                                    AppRouter.kHotelsAndResturantsName,
                                  )
                                  : null,
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text(
                "جميع الحقوق محفوظة لتطبيق visitSyria 2025",
                style: AppStyles.fontsLight10(
                  context,
                ).copyWith(color: AppColors.graySwatch[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
