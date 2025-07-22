import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_general_floating_button.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Profile/profile_options.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Profile/profile_view_header.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ProfileViewHeader()),
              SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
              SliverToBoxAdapter(child: ProfileOptions()),
              SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomGeneralFloatingButton(
              onPressed: () {},
              title: "تسجيل الخروج",
            ),
          ),
        ],
      ),
    );
  }
}
