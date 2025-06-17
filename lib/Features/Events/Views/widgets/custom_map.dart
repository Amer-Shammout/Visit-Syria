import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/widgets/custom_section.dart';

class CustomMap extends StatelessWidget {
  final double latitude;
  final double longitude;

  const CustomMap({super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      title: 'الموقع',
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
              initialCenter: LatLng(latitude, longitude),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.visit_syria',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 20.0,
                    height: 20.0,
                    point: LatLng(latitude, longitude),
                    child: SvgPicture.asset(
                      Assets.iconsLocation,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        AppColors.red,
                        BlendMode.srcATop,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
