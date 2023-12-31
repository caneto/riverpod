// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multitheme_riverpod/Providers/theme_provider.dart';
import 'package:multitheme_riverpod/Style/style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Color> colorsList = [
    Colors.white,
    Colors.black,
    Colors.redAccent,
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.orange,
    Colors.deepPurpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).chipTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Title',
              style: Styles.textTheme(context).displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Theme.of(context).focusColor,
                  ),
                  onPressed: () {},
                ),
                hintText: 'Enter Name',
                hintStyle: Styles.textTheme(context).titleMedium,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).focusColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Checkbox'),
                Checkbox(
                  value: true,
                  onChanged: (value) {
                    if (kDebugMode) {
                      print(value);
                    }
                  },
                ),
              ],
            ),
          ),
          // Text having lorem ipsum paragraph
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nunc eget nisl. Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, eget aliquam nisl nunc eget nisl.',
              style: Styles.textTheme(context).bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Themes',
              style: Styles.textTheme(context).headlineMedium,
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 50,
            child: ListView.builder(
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: colorsList.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final themeNotifer = ref.watch(themeProvider);
                    return GestureDetector(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                            color: colorsList[index],
                            shape: BoxShape.circle),
                      ),
                      onTap: () {
                        themeNotifer.setTheme(index);
                      },
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
