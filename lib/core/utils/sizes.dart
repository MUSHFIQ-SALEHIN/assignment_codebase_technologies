import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

// For responsive spacing, text sizes, and margins
class AppSpacing {
  // Helper function to get responsive values
  static double _getResponsiveValue(BuildContext context, double value) {
    double screenWidth = MediaQuery.of(context).size.width;
    return value * (screenWidth / 375); // Assuming 375 is the base width
  }

  // Global Padding Sizes
  static EdgeInsets paddingXS(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 4.0));
  static EdgeInsets paddingS(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 8.0));
  static EdgeInsets paddingM(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 12.0));
  static EdgeInsets paddingL(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 16.0));
  static EdgeInsets paddingXL(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 24.0));
  static EdgeInsets paddingXXL(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 32.0));

  // Horizontal Padding
  static EdgeInsets paddingHorizontalXS(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 4.0));
  static EdgeInsets paddingHorizontalS(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 8.0));
  static EdgeInsets paddingHorizontalM(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 12.0));
  static EdgeInsets paddingHorizontalL(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 16.0));
  static EdgeInsets paddingHorizontalXL(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 24.0));
  static EdgeInsets paddingHorizontalXXL(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 32.0));

  // Vertical Padding
  static EdgeInsets paddingVerticalXS(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 4.0));
  static EdgeInsets paddingVerticalS(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 8.0));
  static EdgeInsets paddingVerticalM(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 12.0));
  static EdgeInsets paddingVerticalL(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 16.0));
  static EdgeInsets paddingVerticalXL(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 24.0));
  static EdgeInsets paddingVerticalXXL(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 32.0));

  // Global Margin Sizes
  static EdgeInsets marginXS(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 4.0));
  static EdgeInsets marginS(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 8.0));
  static EdgeInsets marginM(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 12.0));
  static EdgeInsets marginL(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 16.0));
  static EdgeInsets marginXL(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 24.0));
  static EdgeInsets marginXXL(BuildContext context) =>
      EdgeInsets.all(_getResponsiveValue(context, 32.0));

  // Horizontal Margin
  static EdgeInsets marginHorizontalXS(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 4.0));
  static EdgeInsets marginHorizontalS(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 8.0));
  static EdgeInsets marginHorizontalM(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 12.0));
  static EdgeInsets marginHorizontalL(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 16.0));
  static EdgeInsets marginHorizontalXL(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 24.0));
  static EdgeInsets marginHorizontalXXL(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: _getResponsiveValue(context, 32.0));

  // Vertical Margin
  static EdgeInsets marginVerticalXS(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 4.0));
  static EdgeInsets marginVerticalS(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 8.0));
  static EdgeInsets marginVerticalM(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 12.0));
  static EdgeInsets marginVerticalL(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 16.0));
  static EdgeInsets marginVerticalXL(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 24.0));
  static EdgeInsets marginVerticalXXL(BuildContext context) =>
      EdgeInsets.symmetric(vertical: _getResponsiveValue(context, 32.0));

  // Vertical Spacing
  static SizedBox verticalSpaceXS(BuildContext context) =>
      SizedBox(height: _getResponsiveValue(context, 4.0));
  static SizedBox verticalSpaceS(BuildContext context) =>
      SizedBox(height: _getResponsiveValue(context, 8.0));
  static SizedBox verticalSpaceM(BuildContext context) =>
      SizedBox(height: _getResponsiveValue(context, 12.0));
  static SizedBox verticalSpaceL(BuildContext context) =>
      SizedBox(height: _getResponsiveValue(context, 16.0));
  static SizedBox verticalSpaceXL(BuildContext context) =>
      SizedBox(height: _getResponsiveValue(context, 24.0));
  static SizedBox verticalSpaceXXL(BuildContext context) =>
      SizedBox(height: _getResponsiveValue(context, 32.0));

  // Horizontal Spacing
  static SizedBox horizontalSpaceXS(BuildContext context) =>
      SizedBox(width: _getResponsiveValue(context, 4.0));
  static SizedBox horizontalSpaceS(BuildContext context) =>
      SizedBox(width: _getResponsiveValue(context, 8.0));
  static SizedBox horizontalSpaceM(BuildContext context) =>
      SizedBox(width: _getResponsiveValue(context, 12.0));
  static SizedBox horizontalSpaceL(BuildContext context) =>
      SizedBox(width: _getResponsiveValue(context, 16.0));
  static SizedBox horizontalSpaceXL(BuildContext context) =>
      SizedBox(width: _getResponsiveValue(context, 24.0));
  static SizedBox horizontalSpaceXXL(BuildContext context) =>
      SizedBox(width: _getResponsiveValue(context, 32.0));
}

class AppTextStyles {
  // Helper function to scale font sizes based on screen width
  static double _getResponsiveFontSize(BuildContext context, double fontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Scaling font size based on screen width (you can fine-tune this formula)
    return fontSize *
        (screenWidth /
            375); // Assuming 375 is the base width (like for iPhone 6)
  }

  // Headings
  static TextStyle headingXL(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, 32.0),
    fontWeight: FontWeight.bold,
  );
  static TextStyle headingL(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, 28.0),
    fontWeight: FontWeight.bold,
  );
  static TextStyle headingM(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, 24.0),
    fontWeight: FontWeight.bold,
  );
  static TextStyle headingS(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, 20.0),
    fontWeight: FontWeight.bold,
  );

  // Body Text
  static TextStyle bodyL(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, 18.0),
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyM(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, 16.0),
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyS(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, 14.0),
    fontWeight: FontWeight.normal,
  );

  // Captions & Labels
  static TextStyle caption(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, 12.0),
    fontWeight: FontWeight.w400,
  );
  static TextStyle label(BuildContext context) => TextStyle(
    fontSize: _getResponsiveFontSize(context, 10.0),
    fontWeight: FontWeight.w400,
  );
}
