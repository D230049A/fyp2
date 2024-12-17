import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> favouriteItems = [
      'Casual T-Shirt',
      'Blue Jeans',
      'Summer Dress',
      'Sneakers',
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Favourite',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: favouriteItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    favouriteItems[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // Logic to remove from favorites can be added here
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
