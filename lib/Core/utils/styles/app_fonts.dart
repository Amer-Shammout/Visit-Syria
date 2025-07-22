import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

abstract class AppStyles {
  static TextStyle fontsBlack32(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 32),
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle fontsBlack24(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 24),
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle fontsBlack22(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 22),
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle fontsBold32(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 32),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold24(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 24),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold22(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 22),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold20(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 20),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsRegular20(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 20),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsRegular24(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 24),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsBold64(context) {
    return TextStyle(
      color: AppColors.primarySwatch,
      fontSize: getResponsiveFontSize(context, baseFontSize: 64),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold18(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 18),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold16(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 16),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold14(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsRegular16(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 16),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsRegular14(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsBold12(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsRegular12(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsRegular10(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 10),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsLight14(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle fontsLight12(context, size) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: size),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle fontsLight10(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 10),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle fontsLight8(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 8),
      fontWeight: FontWeight.w300,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required baseFontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * baseFontSize;
  double lowerLimit = baseFontSize * .8;
  double upperLimit = baseFontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  // PlatformDispatcher dispatcher = PlatformDispatcher.instance;
  // double phisicalWidth = dispatcher.views.first.physicalSize.width;
  // double devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double screenWidth = phisicalWidth / devicePixelRatio;

  double screenWidth = MediaQuery.sizeOf(context).width;
  // if (screenWidth < SizeConfig.tablet) {
  //   return screenWidth / 550;
  // } else if (screenWidth < SizeConfig.desktop) {
  //   return screenWidth / 1000;
  // } else {
  return screenWidth / 1920;
  // }
}
