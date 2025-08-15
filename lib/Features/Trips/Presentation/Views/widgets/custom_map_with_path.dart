import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_section.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_path.dart';

class CustomMapWithPath extends StatelessWidget {
  final TripPath tripPath;

  const CustomMapWithPath({super.key, required this.tripPath});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: 'مسار الرحلة',
      hasSeeAll: false,
      section: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FlutterMap(
            options: MapOptions(
              initialCenter: getCenterOfMap(tripPath.markers!),
              initialZoom: 14.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.visit_syria',
              ),

              PolylineLayer(
                polylines: [
                  Polyline(
                    points: tripPath.route!,
                    color: AppColors.primary,
                    strokeWidth: 4.0,
                  ),
                ],
              ),

              MarkerLayer(
                markers: List.generate(tripPath.markers!.length, (index) {
                  final point = tripPath.markers![index];
                  return Marker(
                    width: 20,
                    height: 20,
                    point: point,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${index + 1}',
                        style: AppStyles.fontsRegular10(
                          context,
                        ).copyWith(color: AppColors.whiteColor),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

LatLng getCenterOfMap(List<LatLng> routePoints) {
  double minLatitude = routePoints.first.latitude;
  double minLongitude = routePoints.first.longitude;
  double maxLatitude = routePoints.first.latitude;
  double maxLongitude = routePoints.first.longitude;

  for (LatLng point in routePoints) {
    if (maxLatitude < point.latitude) {
      maxLatitude = point.latitude;
    }
    if (maxLongitude < point.longitude) {
      maxLongitude = point.longitude;
    }
    if (minLatitude > point.latitude) {
      minLatitude = point.latitude;
    }
    if (minLongitude > point.longitude) {
      minLongitude = point.longitude;
    }
  }
  double latitude = (minLatitude + maxLatitude) / 2;
  double longitude = (minLongitude + maxLongitude) / 2;
  LatLng centerOfMap = LatLng(latitude, longitude);
  return centerOfMap;
}
