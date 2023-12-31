import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app/app/features/home/page/home.page.dart';
import 'package:in_app/app/core/hooks/use_in_app_purchase.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize inAppPurchase earlier
    useInAppPurchaseController(ref);

    return const MaterialApp(
      title: 'Flutter in-app-purchase',
      home: HomePage(),
    );
  }
}
