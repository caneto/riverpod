import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_gen_trial/features/home/controller/home_controller.dart';
import 'package:riverpod_gen_trial/features/home/state/home_state.dart';

import 'package:riverpod_widget_annotation/riverpod_widget_annotation.dart';

part 'home_view.g.dart';

@riverpodWidget
class HomeView extends HomeViewBase {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeController controller,
      HomeState state, WidgetRef ref) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              controller.fetchSomething();
            },
            child: const Text("Fetch Something"),
          ),
          Text(
            "HOME VIEW",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          FlutterLogo(
            size: MediaQuery.of(context).size.width / 2,
          ),
        ],
      ),
    ));
  }
}
