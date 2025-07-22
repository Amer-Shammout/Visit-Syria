import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Setting%20Info/setting_info_view_body_consumer.dart';

class SettingInfoView extends StatelessWidget {
  const SettingInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SettingInfoViewBodyConsumer());
  }
}
