import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Settings/Presentation/Views/widgets/about_app_and_privacy_policy_items_list_view_builder.dart';

class AboutAppViewBody extends StatelessWidget {
  const AboutAppViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AboutAppAndPrivacyPolicyItemsListViewBuilder(type: "about_app");
  }
}
