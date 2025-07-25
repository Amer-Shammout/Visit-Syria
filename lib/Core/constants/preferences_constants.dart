// lib/Core/constants/preferences_constants.dart

import 'package:visit_syria/Features/Auth/Data/Models/preferences_section_data.dart';

const List<String> kSeasonOptions = ["الشتاء", "الربيع", "الصيف", "الخريف"];

const List<String> kTripTypesOptions = [
  "مغامرات ونشاطات",
  "استجمام واسترخاء",
  "رحلات شبابية",
  "سياحة تاريخية وثقافية",
  "تجارب محلية وأطعمة تقليدية",
  "رحلات عائلية",
];

const List<String> kTripDurationsOptions = [
  "يوم واحد",
  "2-3 أيام",
  "4-7 أيام",
  "أكثر من أسبوع",
];

const List<String> kGovernoratesOptions = [
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
    key: "preferredSeason",
    options: kSeasonOptions,
  ),
  PreferencesSectionData(
    title: "ما نوع الرحلات التي تفضلها؟",
    key: "preferredActivities",
    options: kTripTypesOptions,
  ),
  PreferencesSectionData(
    title: "ما المدة التي تفضلها للرحلة؟",
    key: "duration",
    options: kTripDurationsOptions,
  ),
  PreferencesSectionData(
    title: "ما هي المحافظات التي تفضل زيارتها؟",
    key: "cities",
    options: kGovernoratesOptions,
  ),
];
