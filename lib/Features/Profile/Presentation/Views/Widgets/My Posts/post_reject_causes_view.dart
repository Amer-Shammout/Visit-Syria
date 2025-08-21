import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Profile/Presentation/Views/Widgets/My%20Posts/post_reject_causes_view_body.dart';

class PostRejectCausesView extends StatelessWidget {
  const PostRejectCausesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(hasTitle: true, title: "الأسئلة الشائعة"),
      body: PostRejectCausesViewBody(),
    );
  }
}
