import 'package:get/get.dart';

class Dimensions {
  // Pixel 6 dimensions (approximately)
  static const double pixel6Height = 857.0; // Adjusted based on common ratios
  static const double pixel6Width = 393.0; // Adjusted based on common ratios

  static double screenHeight = Get.context != null ? Get.context!.height : pixel6Height;
  static double screenWidth = Get.context != null ? Get.context!.width : pixel6Width;

  // Base dimensions (using Pixel 6 as base)
  static const double baseHeight = pixel6Height;
  static const double baseWidth = pixel6Width;

  // Heights (using ratios)
  static double height5 = screenHeight * (5 / baseHeight);
  static double height10 = screenHeight * (10 / baseHeight);
  static double height15 = screenHeight * (15 / baseHeight);
  static double height20 = screenHeight * (20 / baseHeight);
  static double height25 = screenHeight * (25 / baseHeight);
  static double height30 = screenHeight * (30 / baseHeight);
  static double height45 = screenHeight * (45 / baseHeight);

  // Widths (using ratios)
  static double width5 = screenWidth * (5 / baseWidth);
  static double width10 = screenWidth * (10 / baseWidth);
  static double width15 = screenWidth * (15 / baseWidth);
  static double width20 = screenWidth * (20 / baseWidth);
  static double width25 = screenWidth * (25 / baseWidth);
  static double width30 = screenWidth * (30 / baseWidth);
  static double width40 = screenWidth * (40 / baseWidth);

  // Font sizes (using ratios)
  static double font12 = screenHeight * (12 / baseHeight);
  static double font14 = screenHeight * (14 / baseHeight);
  static double font16 = screenHeight * (16 / baseHeight);
  static double font20 = screenHeight * (20 / baseHeight);
  static double font26 = screenHeight * (26 / baseHeight);

  // Radius (using ratios)
  static double radius10 = screenWidth * (10 / baseWidth);
  static double radius15 = screenWidth * (15 / baseWidth);
  static double radius20 = screenWidth * (20 / baseWidth);
  static double radius30 = screenWidth * (30 / baseWidth);
  static double radius40 = screenWidth * (40 / baseWidth);

  // Icon sizes (using ratios)
  static double iconSize16 = screenHeight * (16 / baseHeight);
  static double iconSize24 = screenHeight * (24 / baseHeight);

  // PageView elements (using ratios)
  static double pageView = screenHeight * (320 / baseHeight);
  static double pageViewContainer = screenHeight * (266.67 / baseHeight);
  static double pageViewTextContainer = screenHeight * (145.45 / baseHeight);

  // List View (using ratios)
  static double listViewImgSize = screenWidth * (144 / baseWidth);
  static double listViewTextContSize = screenWidth * (120 / baseWidth);

  // Popular food image (using ratios)
  static double popularFoodImgSize = screenHeight * (363.63 / baseHeight);

  // Bottom bar height (using ratios)
  static double bottomHeightBar = screenHeight * (145.45 / baseHeight);
}