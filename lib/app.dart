import 'package:flutter/material.dart';
import 'package:wordy/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          elevation: 4.0,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        useMaterial3: true,
      ),
      routes: routes.map((key, value) => MapEntry(key, value.import)),
    );
  }
}
