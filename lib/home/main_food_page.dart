import 'package:flutter/material.dart';
import 'package:lovelymeal/home/food_page_body.dart';
import 'package:lovelymeal/widgets/small_text.dart';
import 'package:lovelymeal/widgets/Big_text.dart';
import '../utils/colors.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("Current height is${MediaQuery.of(context).size.height}");
    return  Scaffold(
          body: Column(
            children: [
              //showing the header
              Container(
                margin: EdgeInsets.only(top: 45, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "India", color: AppColors.mainColor,),
                        Row(
                          children: [
                            SmallText(text: 'Phagwara', color: Colors.black,),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    )
                  ],
                ),
              ),
              //showing the body
              FoodPageBody(),
            ],
          ),
      );
  }
}
