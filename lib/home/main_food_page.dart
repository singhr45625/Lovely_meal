import 'package:flutter/material.dart';
import 'package:lovelymeal/widgets/small_text.dart';
import 'package:lovelymeal/widgets/big_text.dart';
import 'package:lovelymeal/utils/colors.dart';
import 'package:lovelymeal/models/product.dart';
import 'package:lovelymeal/models/cart_page.dart';
import 'package:lovelymeal/models/product_detail_page.dart'; // Import ProductDetailPage
import 'package:provider/provider.dart';
import '../home/food_page_body.dart';
import '../utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _allProducts = [];
  List<Product> _searchResults = [];
  String _selectedLocation = 'Phagwara';
  bool _showSearchBar = false;

  final List<String> _locations = [
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Dimensions.init(context);
      print("Dimensions initialized in MainFoodPage: screenHeight=${Dimensions.screenHeight}, screenWidth=${Dimensions.screenWidth}");
    });
  }

  List<Product> _getAllProducts() {
    return [
      Product(
        imagePath: "assets/image/chinese.jpg",
        title: "Chinese Side Dish",
        description: "Delicious spicy side dish from China.",
        rating: 4.5,
        comments: 1287,
        price: 149.0,
        calories: 320,
        distance: "1.2 km",
        time: "25 min",
      ),
      Product(
        imagePath: "assets/image/italian.jpg",
        title: "Italian Pasta",
        description: "Authentic creamy Alfredo Italian pasta.",
        rating: 4.8,
        comments: 2000,
        price: 229.0,
        calories: 480,
        distance: "2.0 km",
        time: "30 min",
      ),
      Product(
        imagePath: "assets/image/indian.webp",
        title: "South Indian Thali",
        description: "Desi-style thali with roti, sabzi, rice & more.",
        rating: 4.9,
        comments: 4580,
        price: 199.0,
        calories: 550,
        distance: "1.5 km",
        time: "35 min",
      ),
    ];
  }

  void _performSearch() {
    final searchText = _searchController.text.trim().toLowerCase();

    if (searchText.isEmpty) {
      _searchResults = [];
    } else {
      _searchResults = _allProducts
          .where((product) =>
      product.title.toLowerCase().contains(searchText) ||
          product.description.toLowerCase().contains(searchText))
          .toList();
    }

    setState(() {});
  }

  void _clearSearch() {
    _searchController.clear();
    _searchResults.clear();
    _showSearchBar = false;
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
                  _allProducts = _getAllProducts();
                  _searchResults = [];
                });
                Navigator.pop(context);
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Location and Search Icon
            Container(
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "India", color: AppColors.mainColor),
                      InkWell(
                        onTap: () => _showLocationPicker(context),
                        child: Row(
                          children: [
                            SmallText(
                              text: _selectedLocation,
                              color: Colors.black,
                            ),
                            const Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _showSearchBar = !_showSearchBar;
                        _searchResults.clear();
                        if (!_showSearchBar) {
                          _clearSearch();
                        }
                      });
                    },
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

            // Search Bar
            if (_showSearchBar)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => _performSearch(),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search food...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: _clearSearch,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),

            // Results or Body
            if (_searchResults.isNotEmpty)
              _buildSearchResults()
            else
              const FoodPageBody(), // Assuming FoodPageBody displays the main product list
          ],
        ),
      ),

      // 🛒 Floating Cart Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartPage()),
          );
        },
      ),
    );
  }

  Widget _buildSearchResults() {
    return Column(
      children: List.generate(_searchResults.length, (index) {
        Product product = _searchResults[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
                // Image
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
                const SizedBox(width: 10),
                // Title and Description
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(text: product.title),
                          const SizedBox(height: 5),
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
          ),
        );
      }),
    );
  }
}