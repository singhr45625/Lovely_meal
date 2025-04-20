import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lovelymeal/models/cart_controller.dart';
import 'package:lovelymeal/home/login_screen.dart';
import 'package:lovelymeal/home/main_food_page.dart';
import 'package:lovelymeal/utils/dimensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lovely Meal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AppRoot(),
      ),
    );
  }
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Dimensions.init(context);
      print("Dimensions initialized in AppRoot: screenHeight=${Dimensions.screenHeight}, screenWidth=${Dimensions.screenWidth}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return const LoginScreen(); // Or your initial screen logic
  }
}