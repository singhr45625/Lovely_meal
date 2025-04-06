import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; // 2400 for Pixel 6
  static double screenWidth = Get.context!.width;   // 1080 for Pixel 6

  // Heights
  static double height5 = screenHeight / 480;
  static double height10 = screenHeight / 240;
  static double height15 = screenHeight / 160;
  static double height20 = screenHeight / 120;
  static double height25 = screenHeight / 96;
  static double height30 = screenHeight / 80;
  static double height45 = screenHeight / 53.3;

  // Widths
  static double width5 = screenWidth / 216;
  static double width10 = screenWidth / 108;
  static double width15 = screenWidth / 72;
  static double width20 = screenWidth / 54;
  static double width25 = screenWidth / 43.2;
  static double width30 = screenWidth / 36;

  // Font sizes
  static double font12 = screenHeight / 200;
  static double font14 = screenHeight / 171.4;
  static double font16 = screenHeight / 150;
  static double font20 = screenHeight / 120;
  static double font26 = screenHeight / 92.3;

  // Radius
  static double radius10 = screenHeight / 240;
  static double radius15 = screenHeight / 160;
  static double radius20 = screenHeight / 120;
  static double radius30 = screenHeight / 80;

  // Icon sizes
  static double iconSize16 = screenHeight / 150;
  static double iconSize24 = screenHeight / 100;

  // PageView elements
  static double pageView = screenHeight / 2.8; // 857 px
  static double pageViewContainer = screenHeight / 3.5;
  static double pageViewTextContainer = screenHeight / 6.5;

  // List View
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContSize = screenWidth / 3.9;

  // Popular food image
  static double popularFoodImgSize = screenHeight / 2.4;

  // Bottom bar height
  static double bottomHeightBar = screenHeight / 6.5;
}
