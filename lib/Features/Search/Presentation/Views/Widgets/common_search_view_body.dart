import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Search/Presentation/Manager/search_cubit/search_cubit.dart';

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
          onTagSelected: (value, index) {
            context.read<SearchCubit>().selectTagIndex(index);
          },
        ),
        SizedBox(height: AppSpacing.s16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CustomTextFormField(
            hintWidget: DefaultTextStyle(
              style: AppStyles.fontsRegular16(
                context,
              ).copyWith(color: AppColors.graySwatch[600]),
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(seconds: 3),
                animatedTexts: [
                  TypewriterAnimatedText("بحث عن الأحداث..."),
                  TypewriterAnimatedText("بحث عن الرحلات..."),
                  TypewriterAnimatedText("بحث عن الأماكن..."),
                  TypewriterAnimatedText("بحث عن الفنادق..."),
                ],
                onTap: () {},
              ),
            ),
            // hint: "ماذا تريد؟",
            keyboardType: TextInputType.text,
            onChanged: (txt) {
              context.read<SearchCubit>().setQuery(txt);
              if (txt.isEmpty) {
                context.read<SearchCubit>().showHistory();
              } else {
                context.read<SearchCubit>().doSearch();
              }
            },
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
