import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class CommonSearchViewBody extends StatelessWidget {
  const CommonSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        TagsListView(
          data: [
            "الاحداث",
            "الرحلات",
            "المواقع",
            "المطاعم",
            "الفنادق",
            "المقالات",
            "شركات السياحة",
            "المنشورات",
          ],
        ),
        SizedBox(height: AppSpacing.s16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomTextFormField(
            hint: "ماذا تريد؟",
            keyboardType: TextInputType.text,
            onChanged: (p0) {},
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 12),
                child: SvgPicture.asset(
                  Assets.iconsSearch,
                  alignment: Alignment.center,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.graySwatch,
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
