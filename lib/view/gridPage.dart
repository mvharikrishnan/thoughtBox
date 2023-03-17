import 'dart:developer';

import 'package:flutter/material.dart';

class GridPageScreen extends StatefulWidget {
  GridPageScreen(
      {required this.alphaController,
      required this.columnController,
      required this.rowController,
      super.key});
  final TextEditingController rowController;
  final TextEditingController columnController;
  final TextEditingController alphaController;

  @override
  State<GridPageScreen> createState() => _GridPageScreenState();
}

class _GridPageScreenState extends State<GridPageScreen> {
  int gridCount = 0;
  List searchList = [];
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List listOfStrings = widget.alphaController.text.split('');
    log(listOfStrings.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("GRID"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Enter the Word To search"),
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  searchList = searchController.text.split('');
                });
                log("Search text list is $searchList");
              },
              child: const Text("Search"),
            ),
            Expanded(
              child: searchList.isEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2,
                      ),
                      itemCount: listOfStrings.length,
                      itemBuilder: (context, index) {
                        return containerWidget(
                          color: Colors.blue,
                          textOnContainer: listOfStrings[index],
                        );
                      },
                    )
                  :
                  //AFter Searching
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 2,
                      ),
                      itemCount: listOfStrings.length,
                      itemBuilder: (context, index) {
                        if (searchList.any(
                            (element) => element == listOfStrings[index])) {
                          log("++++");
                          return containerWidget(
                            color: Colors.red,
                            textOnContainer: listOfStrings[index],
                          );
                        } else {
                          log("-------");
                          return containerWidget(
                            color: Colors.blue,
                            textOnContainer: listOfStrings[index],
                          );
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class containerWidget extends StatelessWidget {
  const containerWidget({
    required this.textOnContainer,
    required this.color,
    super.key,
  });
  final String textOnContainer;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        textOnContainer,
        style: TextStyle(fontSize: 30),
      )),
      color: color,
    );
  }
}
