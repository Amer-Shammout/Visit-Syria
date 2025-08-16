class AirportSearchResultModel {
  final String? type, country, name, iataCode;

  const AirportSearchResultModel({
    this.type,
    this.country,
    this.name,
    this.iataCode,
  });

  factory AirportSearchResultModel.fromJson(Map<String, dynamic> json) =>
      AirportSearchResultModel(
        type: json['airport'] as String?,
        country: json['country'] as String?,
        name: json['name'] as String?,
        iataCode: json['iataCode'] as String?,
      );
}
