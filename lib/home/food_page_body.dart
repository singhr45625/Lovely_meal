import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lovelymeal/models/product.dart';
import 'package:lovelymeal/utils/colors.dart';
import 'package:lovelymeal/utils/dimensions.dart';
import 'package:lovelymeal/widgets/Big_text.dart';
import 'package:lovelymeal/widgets/icon_and_text.dart';
import 'package:lovelymeal/widgets/small_text.dart';
import 'package:lovelymeal/models/product_detail_page.dart'; // import detail page

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;

  List<Product> products = [
    Product(
      imagePath: "assets/image/chinese.jpg",
      title: "Chinese Side Dish",
      description:
      "A savory and spicy side dish packed with authentic Chinese flavors. Best enjoyed with noodles or rice, made with freshly tossed vegetables, soy sauce, and a hint of garlic.",
      rating: 4.5,
      comments: 1287,
      price: 149.0,
      calories: 350,
      distance: "1.7 km",
      time: "32 min",
    ),
    Product(
      imagePath: "assets/image/italian.jpg",
      title: "Classic Italian Pasta",
      description:
      "Traditional Italian penne pasta tossed in a creamy Alfredo sauce with herbs and grilled veggies. Topped with parmesan cheese.",
      rating: 4.8,
      comments: 1764,
      price: 249.0,
      calories: 450,
      distance: "1.3 km",
      time: "30 min",
    ),
    Product(
      imagePath: "assets/image/indian.webp",
      title: "South Indian Thali",
      description:
      "A healthy and satisfying thali consisting of idli, dosa, sambhar, chutneys, and curd rice. Made with traditional South Indian spices.",
      rating: 4.6,
      comments: 1452,
      price: 179.0,
      calories: 520,
      distance: "0.9 km",
      time: "28 min",
    ),
    Product(
      imagePath: "assets/image/rajma.jpg",
      title: "Punjabi Rajma Chawal",
      description:
      "Delicious kidney beans slow-cooked in rich tomato gravy and served with steamed basmati rice. A comfort food favorite.",
      rating: 4.4,
      comments: 987,
      price: 139.0,
      calories: 470,
      distance: "1.5 km",
      time: "35 min",
    ),
    Product(
      imagePath: "assets/image/pizza.webp",
      title: "Farmhouse Pizza",
      description:
      "Wood-fired pizza loaded with bell peppers, olives, sweet corn, mushrooms, and mozzarella cheese on a thin crust.",
      rating: 4.9,
      comments: 2230,
      price: 299.0,
      calories: 780,
      distance: "2.8 km",
      time: "40 min",
    ),
  ];

  List<Product> popularProducts = [
    Product(
      imagePath: "assets/image/indian.webp",
      title: "South Indian Thali",
      description:
      "A healthy and satisfying thali consisting of idli, dosa, sambhar, chutneys, and curd rice. Made with traditional South Indian spices.",
      rating: 4.6,
      comments: 1452,
      price: 179.0,
      calories: 520,
      distance: "0.9 km",
      time: "28 min",
    ),
    Product(
      imagePath: "assets/image/biryani.jpg",
      title: "Hyderabadi Biryani",
      description:
      "Aromatic basmati rice layered with tender chicken marinated in traditional spices, slow-cooked for rich flavor and texture.",
      rating: 4.8,
      comments: 2410,
      price: 259.0,
      calories: 640,
      distance: "2.0 km",
      time: "38 min",
    ),
    Product(
      imagePath: "assets/image/dessert.webp",
      title: "Gulab Jamun with Rabri",
      description:
      "Soft khoya balls dipped in sugar syrup and served with thick creamy rabri. A perfect Indian dessert to end your meal.",
      rating: 4.7,
      comments: 1120,
      price: 119.0,
      calories: 300,
      distance: "1.2 km",
      time: "20 min",
    ),
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
        Container(
          height: Dimensions.pageView(),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: products.length,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailPage(product: products[position]),
                          ),
                        );
                      },
                      child: _buildPageItem(position),
                    );
                  },
                ),
              ),
              DotsIndicator(
                dotsCount: products.length,
                position: _currPageValue,
                decorator: DotsDecorator(
                  activeColor: AppColors.mainColor,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height30()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10()),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10()),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height10()),
        SizedBox(
          height: Dimensions.listViewTextContSize() * 6.5,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: popularProducts.length,
            itemBuilder: (context, index) {
              Product product = popularProducts[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(product: product),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20(),
                      vertical: Dimensions.height10() / 2),
                  child: Row(
                    children: [
                      Container(
                        width: Dimensions.listViewImgSize(),
                        height: Dimensions.listViewImgSize(),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.radius20()),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(product.imagePath),
                          ),
                        ),
                      ),
                      SizedBox(width: Dimensions.width10()),
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextContSize(),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight:
                              Radius.circular(Dimensions.radius20()),
                              bottomRight:
                              Radius.circular(Dimensions.radius20()),
                            ),
                          ),
                          padding: EdgeInsets.all(Dimensions.width10()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: product.title),
                              SizedBox(height: Dimensions.height10()),
                              SmallText(
                                text: product.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: Dimensions.height10()),
                              Row(
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.circle,
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
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = Dimensions.pageViewContainer() * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = Dimensions.pageViewContainer() * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = Dimensions.pageViewContainer() * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = _scaleFactor;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, Dimensions.pageViewContainer() * (1 - _scaleFactor) / 2, 1);
    }

    Product product = products[index];

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer(),
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width10()),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30()),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(product.imagePath),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: Dimensions.height10(),
            child: Container(
              height: Dimensions.pageViewTextContainer(),
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width30()),
              padding: EdgeInsets.all(Dimensions.height15()),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20()),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: product.title),
                  SizedBox(height: Dimensions.height10()),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                              (_) => Icon(Icons.star,
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
                  SizedBox(height: Dimensions.height20()),
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
