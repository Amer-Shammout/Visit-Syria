import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/passenger_count_model.dart';

String buildPassengerText(PassengerCountModel model) {
  List<String> parts = [];
  parts.add("${model.adults} بالغ");
  if (model.children > 0) parts.add("${model.children} أطفال");
  if (model.infants > 0) parts.add("${model.infants} رضيع");
  return parts.join(" ، ");
}
