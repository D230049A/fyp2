import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, String?> selectedOutfits;

  const ResultScreen({super.key, required this.selectedOutfits});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                width: 200,
                height: 300,
                color: Colors.grey[300], // 最终搭配图占位符
                child: const Icon(Icons.person, size: 100),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const Text(
                  "Your Selected Outfits",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // 显示选择的服装
                Text("Headpiece: ${selectedOutfits['headpiece'] ?? 'None'}"),
                Text("Shirt: ${selectedOutfits['shirt'] ?? 'None'}"),
                Text("Pants: ${selectedOutfits['pants'] ?? 'None'}"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Edit"),
            ),
          ),
        ],
      ),
    );
  }
}
