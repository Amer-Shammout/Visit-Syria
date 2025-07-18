import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/Personal%20Info/personal_view_body.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true, title: "المعلومات الشخصية"),
      body: PersonalViewBody(),
    );
  }
}

