import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/home_cubit/home_cubit.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/home_cubit/home_state.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/home_view_body.dart';

class HomeViewBodyBuilder extends StatelessWidget {
  const HomeViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: CustomLoadingIndicator());
        }

        if (state.errorMessage != null) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsFailure,
            text: state.errorMessage!,
            onTap: () => BlocProvider.of<HomeCubit>(context).fetchHomeData(),
            buttonText: "أعادة المحاولة",
          );
        }
        return HomeViewBody(events: state.events,places: state.topRatedPlaces,weathers: state.weathers,);
      },
    );
  }
}
