import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/airport_search_result_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_search_data.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Repos/flights_repo.dart';

class FlightsRepoImpl extends FlightsRepo {
  @override
  Future<Either<Failure, List<FlightModel>>> searchFlightOffers({
    required FlightSearchData searchData,
  }) async {
    final queryParams = {
      "direction": searchData.direction,
      "originLocationCode": searchData.fromAirport,
      "destinationLocationCode": searchData.toAirport,
      "departureDate": searchData.departureDate,
      "adults": searchData.passengers.adults.toString(),
      "children": searchData.passengers.children.toString(),
      "infants": searchData.passengers.infants.toString(),
      "travelClass": searchData.airlineClass,
      "nonStop": searchData.nonStop.toString(),
      "max": searchData.max.toString(),
    };
    if (searchData.returnDate != null && searchData.returnDate!.isNotEmpty) {
      queryParams["returnDate"] = searchData.returnDate!;
    }

    final url =
        "$kGetFlightOffersUrl?${Uri(queryParameters: queryParams).query}";

    return await handleRequest<List<FlightModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<FlightModel> flights = [];

        for (var offer in data['offers']) {
          flights.add(FlightModel.fromJson(offer));
        }
        return flights;
      },
    );
  }

  @override
  Future<Either<Failure, List<AirportSearchResultModel>>> searchAirports({
    required String keyword,
  }) async {
    final encodedKeyword = Uri.encodeComponent(keyword);
    final url = "$kGetAirportsUrl?keyword=$encodedKeyword";

    return await handleRequest<List<AirportSearchResultModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<AirportSearchResultModel> airports = [];
        if (data is List) {
          for (var item in data) {
            airports.add(AirportSearchResultModel.fromJson(item));
          }
        }
        return airports;
      },
    );
  }
}
