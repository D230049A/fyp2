import 'package:flutter/material.dart';
import 'design_config_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recent Designs"),
      ),
      body: ListView.builder(
        itemCount: 3, // 假设有3个设计
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              color: Colors.grey[300], // 设计图占位符
              child: const Icon(Icons.image),
            ),
            title: Text("Design ${index + 1}"),
            subtitle: const Text("Tap to configure this design"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DesignConfigScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
