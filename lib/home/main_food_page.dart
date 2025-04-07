import 'package:flutter/material.dart';
import 'package:lovelymeal/home/food_page_body.dart';
import 'package:lovelymeal/widgets/small_text.dart';
import 'package:lovelymeal/widgets/Big_text.dart';
import '../utils/colors.dart';
import '../models/product.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _allProducts = [];
  List<Product> _searchResults = [];
  String _selectedLocation = 'Phagwara'; // Default location

  List<String> _locations = [
    'Phagwara',
    'Jalandhar',
    'Ludhiana',
    'Amritsar',
    'Chandigarh',

  ];

  @override
  void initState() {
    super.initState();
    _allProducts = _getAllProducts();
  }

  List<Product> _getAllProducts() {
    return [
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
        description: "Desi Tasty Indian Thali",
        rating: 4.9,
        comments: 4580,
      ),
      // ... add all your products here
    ];
  }

  void _performSearch() {
    String searchText = _searchController.text.toLowerCase();
    _searchResults = _allProducts
        .where((product) =>
    product.title.toLowerCase().contains(searchText) ||
        product.description.toLowerCase().contains(searchText))
        .toList();
    setState(() {});
  }

  void _clearSearch() {
    _searchResults.clear();
    _searchController.clear();
    setState(() {});
  }

  void _showLocationPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: _locations.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_locations[index]),
              onTap: () {
                setState(() {
                  _selectedLocation = _locations[index];
                });
                Navigator.pop(context); // Close the bottom sheet
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Current height is ${MediaQuery.of(context).size.height}");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "India", color: AppColors.mainColor),
                      InkWell( // Wrap the location Row in InkWell.
                        onTap: () => _showLocationPicker(context),
                        child: Row(
                          children: [
                            SmallText(text: _selectedLocation, color: Colors.black),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: _performSearch,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            _searchResults.isNotEmpty
                ? _buildSearchResults()
                : FoodPageBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _clearSearch,
              ),
              const Text('Search Results'),
            ],
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            Product product = _searchResults[index];
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white38,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(product.imagePath),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: product.title),
                            SizedBox(height: 5),
                            SmallText(
                              text: product.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
}