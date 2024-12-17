import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // 模拟产品数据
  final List<Map<String, dynamic>> products = [
    {'name': 'Red Dress', 'isSelected': false},
    {'name': 'Black Dress', 'isSelected': false},
    {'name': 'Black Top', 'isSelected': false},
    {'name': 'Heels', 'isSelected': false},
    {'name': 'White Shirt', 'isSelected': false},
    {'name': 'Blue Jeans', 'isSelected': false},
  ];

  // 添加到列表的逻辑
  void _addToList() {
    final selectedProducts =
    products.where((product) => product['isSelected'] == true).toList();
    if (selectedProducts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No items selected!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${selectedProducts.length} items added to the list!')),
      );
      // 处理逻辑：将选中的产品添加到您的列表（例如购物车或设计清单）
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 两列布局
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300], // 暂无图片时的占位颜色
                        ),
                        child: Center(
                          child: Text(
                            product['name'],
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Checkbox(
                          value: product['isSelected'],
                          onChanged: (bool? value) {
                            setState(() {
                              product['isSelected'] = value ?? false;
                            });
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addToList,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // 全宽按钮
              ),
              child: const Text('Add to List'),
            ),
          ],
        ),
      ),
    );
  }
}
