import 'package:intl/intl.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/segment.dart';

String convertTo12HourFormat(String time24, {bool arabic = false}) {
  try {
    DateTime dateTime = DateFormat("HH:mm").parse(time24);

    if (arabic) {
      return DateFormat("h:mm a", "ar").format(dateTime);
    } else {
      return DateFormat("h:mm a").format(dateTime);
    }
  } catch (e) {
    return time24;
  }
}

Map<String, String> extractDateAndTime(
  String dateTimeString, {
  bool arabic = false,
}) {
  try {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(dateTimeString);

    String date = DateFormat("yyyy-MM-dd").format(dateTime);

    String time12 = convertTo12HourFormat(
      DateFormat("HH:mm").format(dateTime),
      arabic: arabic,
    );

    return {"date": date, "time": time12};
  } catch (e) {
    return {"date": "", "time": ""};
  }
}

List<Map<String, String>> extractTimesFromSegments(
  List<Segment> segments, {
  bool arabic = false,
}) {
  return segments.map((segment) {
    final arrival = extractDateAndTime(segment.arrivalTime!, arabic: arabic);
    final departure = extractDateAndTime(
      segment.departureTime!,
      arabic: arabic,
    );

    return {
      "arrival_date": arrival["date"] ?? "",
      "arrival_time": arrival["time"] ?? "",
      "departure_date": departure["date"] ?? "",
      "departure_time": departure["time"] ?? "",
    };
  }).toList();
}
