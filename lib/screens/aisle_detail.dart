import 'package:flutter/material.dart';
import 'cart.dart';
import 'item.dart';

class aisledetailpage extends StatelessWidget {
  final String aisleName;
  final String aisleImagePath;

  const aisledetailpage({
    required this.aisleName,
    required this.aisleImagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item> selectedItems = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(aisleName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for items...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: InfiniteAisleList(
                onItemAddedToCart: (item) {
                  selectedItems.add(item);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: const Icon(Icons.home),
              iconSize: 40,
            ),
            const SizedBox(width: 80),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart(items: selectedItems)),
                );
              },
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_cart),
                  if (selectedItems.isNotEmpty)
                    Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          selectedItems.length.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                ],
              ),
              iconSize: 40,
            ),
            const SizedBox(width: 80),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(Icons.person),
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class InfiniteAisleList extends StatefulWidget {
  final Function(Item) onItemAddedToCart;

  const InfiniteAisleList({required this.onItemAddedToCart, Key? key}) : super(key: key);

  @override
  _InfiniteAisleListState createState() => _InfiniteAisleListState();
}

class _InfiniteAisleListState extends State<InfiniteAisleList> {
  List<Item> items = List.from(initialItems);
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
          !isLoading) {
        _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    List<Item> newItems = List.from(initialItems); // Replace with actual data fetch

    setState(() {
      items.addAll(newItems);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: (items.length / 2).ceil() + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == (items.length / 2).ceil()) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        int firstIndex = index * 2;
        int secondIndex = firstIndex + 1;

        return Row(
          children: <Widget>[
            Expanded(
              child: ItemCard(
                item: items[firstIndex],
                onItemAddedToCart: widget.onItemAddedToCart,
              ),
            ),
            if (secondIndex < items.length)
              Expanded(
                child: ItemCard(
                  item: items[secondIndex],
                  onItemAddedToCart: widget.onItemAddedToCart,
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class ItemCard extends StatelessWidget {
  final Item item;
  final Function(Item) onItemAddedToCart;

  const ItemCard({
    required this.item,
    required this.onItemAddedToCart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.orange, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              item.imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.discount,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.price,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity, // Full width
                  height: 30, // Reduced height
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDA201), // Light orange background color
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Handle add to cart action
                      onItemAddedToCart(item);
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(color: Color(0xFFFFFFFF)), // Text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}