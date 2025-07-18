import 'package:flutter/material.dart';
import 'package:visit_syria/Core/constants/preferences_constants.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Auth/Presentation/Views/widgets/Preferences/preferences_section.dart';

class PreferencesForm extends StatefulWidget {
  const PreferencesForm({super.key});

  @override
  State<PreferencesForm> createState() => PreferencesFormState();
}

class PreferencesFormState extends State<PreferencesForm> {
  final Map<String, List<String>> selectedPreferences = {
    "seasons": [],
    "types": [],
    "durations": [],
    "governorates": [],
  };

  void toggleSelection(String key, String option) {
    setState(() {
      final list = selectedPreferences[key]!;
      if (list.contains(option)) {
        list.remove(option);
      } else {
        list.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: "التفضيلات",
      hasSeeAll: false,
      widgets:
          kSections
              .map(
                (section) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PreferencesSection(
                        title: section.title,
                        options: section.options,
                        selectedOptions: selectedPreferences[section.key] ?? [],
                        onOptionToggle:
                            (val) => toggleSelection(section.key, val),
                      ),
                      const SizedBox(height: AppSpacing.s32),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}
