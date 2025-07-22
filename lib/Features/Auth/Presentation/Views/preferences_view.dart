import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Preferences/preferences_view_body_consumer.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PreferencesViewBodyConsumer());
  }
}
