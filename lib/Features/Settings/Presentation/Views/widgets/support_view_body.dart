import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Settings/Presentation/Views/widgets/support_form.dart';

class SupportViewBody extends StatelessWidget {
  const SupportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Text(
            "نحب أن نسمع رأيك!\nإذا كان لديك اقتراح، مشكلة، أو تجربة تود مشاركتها معنا، يرجى كتابة ملاحظتك أدناه. ملاحظاتك تساعدنا على تحسين التطبيق وتقديم تجربة أفضل للجميع.",
          ),
          SizedBox(height: AppSpacing.s32),
          SupportForm(),
        ],
      ),
    );
  }
}
