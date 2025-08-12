import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/passenger_count_model.dart';

class FlightSearchData {
  String? fromAirport;
  String? toAirport;
  String? departureDate;
  String? returnDate;
  PassengerCountModel passengers;
  String? airlineClass;
  bool nonStop;

  FlightSearchData({
    this.fromAirport,
    this.toAirport,
    this.departureDate,
    this.returnDate,
    PassengerCountModel? passengers,
    this.airlineClass,
    this.nonStop = false,
  }) : passengers =
           passengers ??
           PassengerCountModel(adults: 1, children: 0, infants: 0);
}
