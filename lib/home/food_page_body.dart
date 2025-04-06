import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lovelymeal/models/product.dart';
import 'package:lovelymeal/utils/colors.dart';
import 'package:lovelymeal/utils/dimensions.dart';
import 'package:lovelymeal/widgets/Big_text.dart';
import 'package:lovelymeal/widgets/icon_and_text.dart';
import 'package:lovelymeal/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  List<Product> products = [
    Product(
      imagePath: "assets/image/food01.png",
      title: "Chinese Side Dish",
      description: "Delicious side dish from China.",
      rating: 4.5,
      comments: 1287,
    ),
    Product(
      imagePath: "assets/image/4783666.jpg",
      title: "Italian Pasta",
      description: "Authentic Italian pasta.",
      rating: 4.8,
      comments: 2000,
    ),
    Product(
      imagePath: "assets/image/11949.jpg",
      title: "Indian Thali",
      description: "Authentic Italian pasta.",
      rating: 4.9,
      comments: 4580,
    ),
    Product(
      imagePath: "assets/image/tacos.jpg",
      title: "Tacos",
      description: "Authentic Italian pasta.",
      rating: 4.8,
      comments: 2000,
    ),
    Product(
      imagePath: "assets/image/4783666.jpg",
      title: "Italian Pasta",
      description: "Authentic Italian pasta.",
      rating: 4.8,
      comments: 2000,
    ),
    // Add more products here...
  ];

  List<Product> popularProducts = [
    Product(
      imagePath: "assets/image/11949.jpg",
      title: "Popular Dish 1",
      description: "Highly rated dish.",
      rating: 4.9,
      comments: 3000,
    ),
    Product(
      imagePath: "assets/image/4831379.jpg",
      title: "Popular Dish 2",
      description: "Another popular choice.",
      rating: 4.7,
      comments: 2500,
    ),
    // Add more popular products here...
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider and Dots
        Container(
          height: Dimensions.pageView,
          child: Column(
            children: [
              // Slider
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: products.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position);
                  },
                ),
              ),
              // Dots
              DotsIndicator(
                dotsCount: products.length,
                position: _currPageValue,
                decorator: DotsDecorator(
                  activeColor: AppColors.mainColor,
                  size: Size.square(9.0),
                  activeSize: Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: Dimensions.height30),

        // Popular title
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.width20, right: Dimensions.width20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),

        SizedBox(height: Dimensions.height10),

        // Popular list
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: popularProducts.length,
          itemBuilder: (context, index) {
            Product product = popularProducts[index];
            return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10),
              child: Row(
                children: [
                  // Image Section
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(product.imagePath),
                      ),
                    ),
                  ),
                  // Text Container
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: product.title),
                            SizedBox(height: Dimensions.height10),
                            SmallText(text: product.description),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: "Normal",
                                    iconColor: AppColors.iconColor1),
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    text: "1.7km",
                                    iconColor: AppColors.mainColor),
                                IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    text: "32min",
                                    iconColor: AppColors.iconColor2),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = _scaleFactor;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    Product product = products[index];

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(product.imagePath),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: Dimensions.height30,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: product.title),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                                (index) => Icon(Icons.star,
                                color: AppColors.mainColor, size: 15),
                          ),
                        ),
                        SizedBox(width: 10),
                        SmallText(text: product.rating.toString()),
                        SizedBox(width: 10),
                        SmallText(text: product.comments.toString()),
                        SizedBox(width: 10),
                        SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: AppColors.iconColor2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}