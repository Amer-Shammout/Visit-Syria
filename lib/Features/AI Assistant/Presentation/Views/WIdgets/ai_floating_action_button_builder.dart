import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Features/AI%20Assistant/Presentation/Managers/get_ai_trips_cubit/get_ai_trips_cubit.dart';

class AiFloatingActionButtonBuilder extends StatelessWidget {
  const AiFloatingActionButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAiTripsCubit, GetAiTripsState>(
      builder: (context, state) {
        if (state is GetAiTripsEmpty || state is GetAiTripsSuccess) {
          return CustomFAB(
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouter.kAIGenerateTripName);
            },
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class CustomFAB extends StatelessWidget {
  const CustomFAB({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.shape,
    this.child,
  });
  final void Function() onPressed;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? AppColors.primary,
      shape:
          shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
      child:
          child ??
          SvgPicture.asset(
            width: 24,
            height: 24,
            Assets.iconsPlus,
            colorFilter: ColorFilter.mode(
              AppColors.whiteColor,
              BlendMode.srcATop,
            ),
          ),
    );
  }
}
