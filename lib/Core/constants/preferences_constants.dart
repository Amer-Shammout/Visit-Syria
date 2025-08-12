// lib/Core/constants/preferences_constants.dart

import 'package:visit_syria/Features/Auth/Data/Models/preferences_section_data.dart';

const List<dynamic> kSeasonOptions = ["الشتاء", "الربيع", "الصيف", "الخريف"];

const List<dynamic> kTripTypesOptions = [
  "مغامرات ونشاطات",
  "استجمام واسترخاء",
  "رحلات شبابية",
  "سياحة تاريخية وثقافية",
  "تجارب محلية وأطعمة تقليدية",
  "رحلات عائلية",
];

const List<dynamic> kTripDurationsOptions = [
  "يوم واحد",
  "2-3 أيام",
  "4-7 أيام",
  "أكثر من أسبوع",
];

const List<dynamic> kGovernoratesOptions = [
  "دمشق",
  "ريف دمشق",
  "حمص",
  "حماة",
  "اللاذقية",
  "طرطوس",
  "حلب",
  "إدلب",
  "الحسكة",
  "دير الزور",
  "الرقة",
  "السويداء",
  "درعا",
  "القنيطرة",
];

final List<PreferencesSectionData> kSections = const [
  PreferencesSectionData(
    title: "ما هي الفصول التي تفضل السياحة فيها؟",
    key: "seasons",
    options: kSeasonOptions,
  ),
  PreferencesSectionData(
    title: "ما نوع الرحلات التي تفضلها؟",
    key: "types",
    options: kTripTypesOptions,
  ),
  PreferencesSectionData(
    title: "ما المدة التي تفضلها للرحلة؟",
    key: "durations",
    options: kTripDurationsOptions,
  ),
  PreferencesSectionData(
    title: "ما هي المحافظات التي تفضل زيارتها؟",
    key: "governorates",
    options: kGovernoratesOptions,
  ),
];
