import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/widgets/loading_dialog.dart';
import 'package:visit_syria/Core/widgets/success_confetti_dialog.dart';
import 'package:visit_syria/Features/Settings/Presentation/Manager/create_support_cubit/create_support_note_cubit.dart';
import 'package:visit_syria/Features/Settings/Presentation/Views/widgets/support_view_body.dart';

class SupportViewBodyListener extends StatefulWidget {
  const SupportViewBodyListener({super.key});

  @override
  State<SupportViewBodyListener> createState() =>
      _SupportViewBodyListenerState();
}

class _SupportViewBodyListenerState extends State<SupportViewBodyListener> {
  late final ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateSupportNoteCubit, CreateSupportNoteState>(
      listener: (context, state) {
        if (state is CreateSupportNoteFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is CreateSupportNoteLoading) {
          showLoadingDialog(context);
        } else {
          GoRouter.of(context).pop();
        }
        if (state is CreateSupportNoteSuccess) {
          showConfettiSuccessDialog(
            context: context,
            confettiController: _confettiController,
            buttonTitle: "العودة للصفحة الرئيسية",
            onPressed: () {
              GoRouter.of(context).goNamed(AppRouter.kAppRootName);
            },
            title: "شكراً لملاحظتك!",
            body:
                " تم إرسال رسالتك بنجاح. نحن نُقدّر وقتك وسنعمل جاهدين على مراجعتها لتحسين تجربتك مع \"لفة بـ سوريا\".",
          );
        }
      },
      child: SupportViewBody(),
    );
  }
}
