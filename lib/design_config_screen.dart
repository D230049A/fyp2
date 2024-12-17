import 'package:flutter/material.dart';
import 'result_screen.dart';

class DesignConfigScreen extends StatefulWidget {
  const DesignConfigScreen({super.key});

  @override
  _DesignConfigScreenState createState() => _DesignConfigScreenState();
}

class _DesignConfigScreenState extends State<DesignConfigScreen> {
  final List<String> outfitList = [
    "Headpiece 1",
    "Shirt 1",
    "Pants 1",
    "Headpiece 2",
    "Shirt 2",
    "Pants 2"
  ];
  // 用Map来存储每个位置的服装
  final Map<String, String?> selectedOutfits = {
    "headpiece": null,
    "shirt": null,
    "pants": null,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Your Outfit"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // 左侧服装列表
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: outfitList.length,
                    itemBuilder: (context, index) {
                      return Draggable<String>(
                        data: outfitList[index],
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              color: Colors.grey[300],
                              child: const Icon(Icons.checkroom),
                            ),
                            title: Text(outfitList[index]),
                          ),
                        ),
                        feedback: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey.withOpacity(0.5),
                            child: const Icon(Icons.checkroom, size: 50),
                          ),
                        ),
                        childWhenDragging: Container(),
                      );
                    },
                  ),
                ),
                // 右侧搭配区域：头饰、衣服、裤子
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 头饰区域
                      DragTarget<String>(
                        onAccept: (data) {
                          setState(() {
                            selectedOutfits["headpiece"] = data; // 更新头饰位置
                          });
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 200,
                            height: 100,
                            color: Colors.grey[300],
                            child: selectedOutfits["headpiece"] == null
                                ? const Center(child: Text("Headpiece"))
                                : Center(child: Text(selectedOutfits["headpiece"]!)),
                          );
                        },
                      ),
                      // 衣服区域
                      DragTarget<String>(
                        onAccept: (data) {
                          setState(() {
                            selectedOutfits["shirt"] = data; // 更新衣服位置
                          });
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 200,
                            height: 100,
                            color: Colors.grey[300],
                            child: selectedOutfits["shirt"] == null
                                ? const Center(child: Text("Shirt"))
                                : Center(child: Text(selectedOutfits["shirt"]!)),
                          );
                        },
                      ),
                      // 裤子区域
                      DragTarget<String>(
                        onAccept: (data) {
                          setState(() {
                            selectedOutfits["pants"] = data; // 更新裤子位置
                          });
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 200,
                            height: 100,
                            color: Colors.grey[300],
                            child: selectedOutfits["pants"] == null
                                ? const Center(child: Text("Pants"))
                                : Center(child: Text(selectedOutfits["pants"]!)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // 确保传递的是正确的 Map
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(selectedOutfits: selectedOutfits),
                  ),
                );
              },
              child: const Text("Done"),
            ),
          ),
        ],
      ),
    );
  }
}
