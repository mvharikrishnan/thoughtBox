import 'package:flutter/material.dart';
import 'package:machinegrid/view/gridPage.dart';

import 'package:machinegrid/view/widgets/textformFieldWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController rowController = TextEditingController();
    final TextEditingController columnController = TextEditingController();
    final TextEditingController alphaController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text("Enter the No of ROWS and COLUMN"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextFormFiledTitle(title: "ROW"),
                TextFormField(
                  controller: rowController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const TextFormFiledTitle(title: "COLUMN"),
                TextFormField(
                  controller: columnController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
                const TextFormFiledTitle(title: "ENTER YOUR TEXT"),
                TextFormField(
                  controller: alphaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GridPageScreen(
                                alphaController: alphaController,
                                columnController: columnController,
                                rowController: rowController),
                          ));
                        },
                        child: const Text("MAKE GRID")),
                  ],
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
