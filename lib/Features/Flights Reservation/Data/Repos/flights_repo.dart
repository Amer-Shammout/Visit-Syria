import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/airport_search_result_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_search_data.dart';

abstract class FlightsRepo {
  Future<Either<Failure, List<FlightModel>>> searchFlightOffers({
    required FlightSearchData searchData,
  });

  Future<Either<Failure, List<AirportSearchResultModel>>> searchAirports({
    required String keyword,
  });
}
