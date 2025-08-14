import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class TripPath extends Equatable {
  final List<LatLng>? markers;
  final List<LatLng>? route;
  final int? routePointCount;

  const TripPath({this.markers, this.route, this.routePointCount});

  factory TripPath.fromJson(Map<String, dynamic> json) {
    return TripPath(
      markers:
          (json['markers'] as List<dynamic>?)
              ?.map(
                (e) => LatLng(
                  (e['lat'] as num).toDouble(),
                  (e['lng'] as num).toDouble(),
                ),
              )
              .toList(),
      route:
          (json['route'] as List<dynamic>?)
              ?.map(
                (e) => LatLng(
                  (e['lat'] as num).toDouble(),
                  (e['lng'] as num).toDouble(),
                ),
              )
              .toList(),
      routePointCount: json['routePointCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'markers':
          markers?.map((e) => {'lat': e.latitude, 'lng': e.longitude}).toList(),
      'route':
          route?.map((e) => {'lat': e.latitude, 'lng': e.longitude}).toList(),
      'routePointCount': routePointCount,
    };
  }

  @override
  List<Object?> get props => [markers, route, routePointCount];
}
