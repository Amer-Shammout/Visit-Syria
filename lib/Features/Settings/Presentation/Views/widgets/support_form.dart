import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/validation.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';
import 'package:visit_syria/Core/widgets/profile_avatar.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/custom_rating_bar.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';
import 'package:visit_syria/Features/Settings/Presentation/Manager/create_support_cubit/create_support_note_cubit.dart';

class SupportForm extends StatefulWidget {
  const SupportForm({super.key});

  @override
  State<SupportForm> createState() => _SupportFormState();
}

class _SupportFormState extends State<SupportForm> {
  AutovalidateMode _isAutoValidate = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? _rate = '1';
  String? _note;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _isAutoValidate,
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(
                imageUrl: GetProfileCubit.userModel?.me?.profile?.photo,
              ),
              SizedBox(width: AppSpacing.s8),
              CustomRatingBar(
                onRatingUpdate:
                    (rate) => setState(() {
                      _rate = rate.toString();
                    }),
              ),
            ],
          ),
          SizedBox(height: 32),
          CustomTextFormField(
            onSaved: (val) => _note = val,
            validator: Validation.validateEmptyField,
            maxLines: 5,
            hint: 'اكتب ملاحظتك هنا',

            textInputAction: TextInputAction.newline,
          ),
          SizedBox(height: 32),
          CustomButton(
            onPressed: _submit,
            title: "إرسال",
            textStyle: AppStyles.fontsBold14(
              context,
            ).copyWith(color: AppColors.whiteColor),
            borderRadius: 16,
            verPadding: 12,
            icon: Assets.iconsArrow,
            iconColor: AppColors.whiteColor,
            size: 16,
            fillColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<CreateSupportNoteCubit>(
        context,
      ).createSupportNote(rating: _rate!, note: _note!);
    } else {
      setState(() {
        _isAutoValidate = AutovalidateMode.always;
      });
    }
  }
}
