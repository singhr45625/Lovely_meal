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
  String _selectedLocation = 'Phagwara';
  bool _showSearchBar = false;

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
            // Top Header
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
                  // Tap to toggle search bar
                  InkWell(
                    onTap: () {
                      setState(() {
                        _showSearchBar = !_showSearchBar;
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

            // Show search bar if toggled
            if (_showSearchBar)
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

            // Show results or default food page
            _searchResults.isNotEmpty
                ? _buildSearchResults()
                : !_showSearchBar
                ? FoodPageBody()
                : const SizedBox(), // Hide when search is open but empty
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Column(
      children: List.generate(_searchResults.length, (index) {
        Product product = _searchResults[index];
        return Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
              const SizedBox(width: 10),
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
        );
      }),
    );
  }
}
