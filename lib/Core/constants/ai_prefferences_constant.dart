import 'package:visit_syria/Features/Auth/Data/Models/preferences_section_data.dart';

const List<dynamic> kAITripTypeOptions = [
  "مغامرات ونشاطات",
  "استجمام واسترخاء",
  "رحلات شبابية",
  "سياحة تاريخية وثقافية",
  "تجارب محلية وأطعمة تقليدية",
  "رحلات عائلية",
];
const List<dynamic> kAITripDurationOptions = [
  "يوم واحد",
  "2-3 أيام",
  "4-7 أيام",
  "أكثر من أسبوع",
];
const List<dynamic> kAIActivityLevelOptions = [
  'متوسط النشاط',
  'مغامرات و نشاط عالي',
  'مريح و هادئ',
];
const List<dynamic> kAITravelPersonOptions = [
  'لوحدي',
  'مع شريك/زوج',
  'مع أصدقاء',
  'مع العائلة (بما فيهم أطفال)',
];
const List<dynamic> kAIPlacesOptions = [
  'طبيعة و جبال',
  'أسواق و مراكز تجارية',
  'أماكن دينية',
  'متاحف و آثار',
  'مطاعم و مقاهي مميزة',
];
const List<dynamic> kAISleepInHotelOptions = [
  'لا أريد',
  'نجمة واحدة',
  'نجمتان',
  '3 نجوم',
  '4 نجوم',
  '5 نجوم',
];
const List<dynamic> kAIGovernorateOptions = [
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

final List<PreferencesSectionData> kAISections = const [
  PreferencesSectionData(
    title: 'ما نوع الرحلات التي تفضلها؟',
    key: "TripTypes",
    options: kAITripTypeOptions,
  ),
  PreferencesSectionData(
    title: 'ما المدة التي تفضلها للرحلة؟',
    key: "TripDuration",
    options: kAITripDurationOptions,
  ),
  PreferencesSectionData(
    title: 'ما مستوى النشاط الذي تفضله؟',
    key: "ActivityLevel",
    options: kAIActivityLevelOptions,
  ),
  PreferencesSectionData(
    title: 'مع من تسافر؟',
    key: "TravelPerson",
    options: kAITravelPersonOptions,
  ),
  PreferencesSectionData(
    title: 'ما هو نوع الأماكن التي تود زيارتها؟',
    key: "PlacesType",
    options: kAIPlacesOptions,
  ),
  PreferencesSectionData(
    title: 'هل تود النوم في فندق؟ كم نجمة؟',
    key: "SleepInHotel",
    options: kAISleepInHotelOptions,
  ),
  PreferencesSectionData(
    title: 'ما هي المحافظات التي تفضل زيارتها؟',
    key: "Governorate",
    options: kAIGovernorateOptions,
  ),
];
