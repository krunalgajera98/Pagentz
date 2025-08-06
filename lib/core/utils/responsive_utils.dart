import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return width < 768 || (width < 900 && height < 600);
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return (width >= 768 && width < 1200) || (width >= 600 && width < 1200 && height >= 600);
  }

  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 1200;
  }

  static double getCardWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.9, 280, screenWidth * 0.95);
    } else if (isTablet(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.4, 320, 500); 
    } else {
      return 500.0;
    }
  }

  static double getLogoSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.25, 80, 120); 
    } else if (isTablet(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.15, 100, 150); 
    }
    return 80.0;
  }

  static double getTitleFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.06, 20, 28); 
    } else if (isTablet(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.04, 24, 32); 
    }
    return 32.0; 
  }

  static double getSubtitleFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.035, 12, 16); 
    } else if (isTablet(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.025, 14, 18);
    }
    return 18.0; 
  }

  static double getButtonHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (isMobile(context)) {
      return ResponsiveUtils.constrainValue(screenHeight * 0.06, 45, 55);
    } else if (isTablet(context)) {
      return ResponsiveUtils.constrainValue(screenHeight * 0.05, 48, 58);
    }
    return 50.0; 
  }

  static double getCardPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.05, 16, 32);
    } else if (isTablet(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.03, 24, 40);
    }
    return 40.0; 
  }

  static double getBorderRadius(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.04, 16, 20);
    } else if (isTablet(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.025, 18, 20);
    }
    return 20.0; 
  }

  static double getInputBorderRadius(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.025, 8, 12);
    } else if (isTablet(context)) {
      return ResponsiveUtils.constrainValue(screenWidth * 0.015, 10, 12);
    }
    return 8.0; 
  }

  static EdgeInsets getInputPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (isMobile(context)) {
      final horizontal = ResponsiveUtils.constrainValue(screenWidth * 0.04, 12, 16);
      final vertical = ResponsiveUtils.constrainValue(screenWidth * 0.035, 12, 16);
      return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
    } else if (isTablet(context)) {
      final horizontal = ResponsiveUtils.constrainValue(screenWidth * 0.025, 16, 20);
      final vertical = ResponsiveUtils.constrainValue(screenWidth * 0.02, 16, 20);
      return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
    }
    return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0); 
  }

  static double getResponsiveSpacing(BuildContext context, double percentage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final spacing = screenWidth * percentage;
    return ResponsiveUtils.constrainValue(spacing, 4, screenWidth * 0.1);
  }

  static double constrainValue(double value, double min, double max) {
    return value.clamp(min, max);
  }

  static double getSafeResponsiveValue(BuildContext context, double percentage, double min, double max) {
    final screenWidth = MediaQuery.of(context).size.width;
    final value = screenWidth * percentage;
    return ResponsiveUtils.constrainValue(value, min, max);
  }
} 