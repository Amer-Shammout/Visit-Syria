import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_general_floating_button.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Personal%20Info/personal_view_form.dart';

class PersonalViewBody extends StatefulWidget {
  const PersonalViewBody({super.key});

  @override
  State<PersonalViewBody> createState() => _PersonalViewBodyState();
}

class _PersonalViewBodyState extends State<PersonalViewBody> {
  final GlobalKey<PersonalViewFormState> _formWidgetKey =
      GlobalKey<PersonalViewFormState>();
  void _handleSubmit() {
    final formState = _formWidgetKey.currentState!;
    if (formState.validateAndSave()) {
      // ignore: unused_local_variable
      final name = formState.birthDate;
      // ignore: unused_local_variable
      final email = formState.lastName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: PersonalViewForm(key: _formWidgetKey)),
              SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: CustomGeneralFloatingButton(
              onPressed: _handleSubmit,
              title: "تعديل",
            ),
          ),
        ],
      ),
    );
  }
}
