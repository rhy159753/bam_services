import 'package:flutter/material.dart';

class ResponsiveDimension {
  static double screenWidth(BuildContext context, {double fraction = 1.0}) {
    return MediaQuery.of(context).size.width * fraction;
  }

  static double screenHeight(BuildContext context, {double fraction = 1.0}) {
    return MediaQuery.of(context).size.height * fraction;
  }
}

class ResponsiveText {
  static double textScaleFactor(BuildContext context) {
    return MediaQuery.of(context).textScaleFactor;
  }

  static double textScaleFactorWithFraction(
    BuildContext context, {
    double fraction = 1.0,
  }) {
    return MediaQuery.of(context).textScaleFactor * fraction;
  }

  static double textScaleFactorWithMin(
    BuildContext context, {
    double min = 1.0,
  }) {
    return MediaQuery.of(context).textScaleFactor < min
        ? min
        : MediaQuery.of(context).textScaleFactor;
  }

  static double textScaleFactorWithMax(
    BuildContext context, {
    double max = 1.0,
  }) {
    return MediaQuery.of(context).textScaleFactor > max
        ? max
        : MediaQuery.of(context).textScaleFactor;
  }

  static double textScaleFactorWithMinMax(
    BuildContext context, {
    double min = 1.0,
    double max = 1.0,
  }) {
    return MediaQuery.of(context).textScaleFactor < min
        ? min
        : MediaQuery.of(context).textScaleFactor > max
            ? max
            : MediaQuery.of(context).textScaleFactor;
  }
}

class ResponsivePadding {
  static EdgeInsetsGeometry paddingAll(BuildContext context, double fraction) {
    return EdgeInsets.all(
      ResponsiveDimension.screenWidth(
        context,
        fraction: fraction,
      ),
    );
  }

  static EdgeInsetsGeometry paddingHorizontal(
    BuildContext context,
    double fraction,
  ) {
    return EdgeInsets.symmetric(
      horizontal: ResponsiveDimension.screenWidth(
        context,
        fraction: fraction,
      ),
    );
  }

  static EdgeInsetsGeometry paddingVertical(
    BuildContext context,
    double fraction,
  ) {
    return EdgeInsets.symmetric(
      vertical: ResponsiveDimension.screenHeight(
        context,
        fraction: fraction,
      ),
    );
  }

  static EdgeInsetsGeometry paddingFromLTRB(
    BuildContext context, {
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.fromLTRB(
      ResponsiveDimension.screenWidth(
        context,
        fraction: left,
      ),
      ResponsiveDimension.screenHeight(
        context,
        fraction: top,
      ),
      ResponsiveDimension.screenWidth(
        context,
        fraction: right,
      ),
      ResponsiveDimension.screenHeight(
        context,
        fraction: bottom,
      ),
    );
  }

  static EdgeInsetsGeometry paddingSymmetric(
    BuildContext context, {
    double vertical = 0.0,
    double horizontal = 0.0,
  }) {
    return EdgeInsets.symmetric(
      vertical: ResponsiveDimension.screenHeight(
        context,
        fraction: vertical,
      ),
      horizontal: ResponsiveDimension.screenWidth(
        context,
        fraction: horizontal,
      ),
    );
  }
}

class ResponsiveMargin {
  static EdgeInsetsGeometry marginAll(BuildContext context, double fraction) {
    return EdgeInsets.all(
      ResponsiveDimension.screenWidth(
        context,
        fraction: fraction,
      ),
    );
  }

  static EdgeInsetsGeometry marginHorizontal(
    BuildContext context,
    double fraction,
  ) {
    return EdgeInsets.symmetric(
      horizontal: ResponsiveDimension.screenWidth(
        context,
        fraction: fraction,
      ),
    );
  }

  static EdgeInsetsGeometry marginVertical(
    BuildContext context,
    double fraction,
  ) {
    return EdgeInsets.symmetric(
      vertical: ResponsiveDimension.screenHeight(
        context,
        fraction: fraction,
      ),
    );
  }

  static EdgeInsetsGeometry marginFromLTRB(
    BuildContext context, {
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return EdgeInsets.fromLTRB(
      ResponsiveDimension.screenWidth(
        context,
        fraction: left,
      ),
      ResponsiveDimension.screenHeight(
        context,
        fraction: top,
      ),
      ResponsiveDimension.screenWidth(
        context,
        fraction: right,
      ),
      ResponsiveDimension.screenHeight(
        context,
        fraction: bottom,
      ),
    );
  }

  static EdgeInsetsGeometry marginSymmetric(
    BuildContext context, {
    double vertical = 0.0,
    double horizontal = 0.0,
  }) {
    return EdgeInsets.symmetric(
      vertical: ResponsiveDimension.screenHeight(
        context,
        fraction: vertical,
      ),
      horizontal: ResponsiveDimension.screenWidth(
        context,
        fraction: horizontal,
      ),
    );
  }
}

class ResponsiveSize {
  static double size(BuildContext context, double fraction) {
    return ResponsiveDimension.screenWidth(
      context,
      fraction: fraction,
    );
  }

  static double sizeWithMin(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double sizeWithMax(
    BuildContext context, {
    double fraction = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) >
            max
        ? max
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double sizeWithMinMax(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
                  context,
                  fraction: fraction,
                ) >
                max
            ? max
            : ResponsiveDimension.screenWidth(
                context,
                fraction: fraction,
              );
  }
}

class ResponsiveFontSize {
  static double fontSize(BuildContext context, double fraction) {
    return ResponsiveDimension.screenWidth(
      context,
      fraction: fraction,
    );
  }

  static double fontSizeWithMin(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double fontSizeWithMax(
    BuildContext context, {
    double fraction = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) >
            max
        ? max
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double fontSizeWithMinMax(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
                  context,
                  fraction: fraction,
                ) >
                max
            ? max
            : ResponsiveDimension.screenWidth(
                context,
                fraction: fraction,
              );
  }
}

class ResponsiveIconSize {
  static double iconSize(BuildContext context, double fraction) {
    return ResponsiveDimension.screenWidth(
      context,
      fraction: fraction,
    );
  }

  static double iconSizeWithMin(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double iconSizeWithMax(
    BuildContext context, {
    double fraction = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) >
            max
        ? max
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double iconSizeWithMinMax(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
                  context,
                  fraction: fraction,
                ) >
                max
            ? max
            : ResponsiveDimension.screenWidth(
                context,
                fraction: fraction,
              );
  }
}

class ResponsiveRadius {
  static double radius(BuildContext context, double fraction) {
    return ResponsiveDimension.screenWidth(
      context,
      fraction: fraction,
    );
  }

  static double radiusWithMin(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double radiusWithMax(
    BuildContext context, {
    double fraction = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) >
            max
        ? max
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double radiusWithMinMax(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
                  context,
                  fraction: fraction,
                ) >
                max
            ? max
            : ResponsiveDimension.screenWidth(
                context,
                fraction: fraction,
              );
  }
}

class ResponsiveElevation {
  static double elevation(BuildContext context, double fraction) {
    return ResponsiveDimension.screenWidth(
      context,
      fraction: fraction,
    );
  }

  static double elevationWithMin(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double elevationWithMax(
    BuildContext context, {
    double fraction = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) >
            max
        ? max
        : ResponsiveDimension.screenWidth(
            context,
            fraction: fraction,
          );
  }

  static double elevationWithMinMax(
    BuildContext context, {
    double fraction = 1.0,
    double min = 1.0,
    double max = 1.0,
  }) {
    return ResponsiveDimension.screenWidth(
              context,
              fraction: fraction,
            ) <
            min
        ? min
        : ResponsiveDimension.screenWidth(
                  context,
                  fraction: fraction,
                ) >
                max
            ? max
            : ResponsiveDimension.screenWidth(
                context,
                fraction: fraction,
              );
  }
}