import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_search/src/pages/search_user_riverpod.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    FlutterError.dumpErrorToConsole(errorDetails);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 100,
              ),
              Text(errorDetails.exceptionAsString().isNotEmpty
                  ? errorDetails.exceptionAsString()
                  : 'Sorry, something went wrong'),
            ],
          ),
        ),
      ),
    );
  };

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter RiverPod Search',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 61, 37, 241),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        primaryColor: const Color.fromARGB(255, 237, 135, 242),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white),
        ),
      ),
      home: const SearchUserRiverpod(),
    );
  }
}
