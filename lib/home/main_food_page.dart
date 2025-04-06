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
    print("Current height is ${MediaQuery.of(context).size.height}");

    return Scaffold(
      body: Column(
        children: [
          // Top header
          Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "India", color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(text: 'Phagwara', color: Colors.black),
                        const Icon(Icons.arrow_drop_down_rounded),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.mainColor,
                  ),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),

          // This makes the body scrollable and properly take available height
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
