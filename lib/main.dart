import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lovelymeal/home/main_food_page.dart';
import 'package:lovelymeal/utils/dimensions.dart'; // Import Dimensions

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context); // Initialize Dimensions here!

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainFoodPage(),
    );
  }
}