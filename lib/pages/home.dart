import 'package:flutter/material.dart';
import '../routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wordy Maya'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: routes.values.map((value) {
            if (value.url == '/') return const SizedBox.shrink();
            return ElevatedButton.icon(
              icon: const Icon(Icons.arrow_right),
              onPressed: () => Navigator.pushNamed(context, value.url),
              label: Text(value.title),
            );
          }).toList(),
        ),
      ),
    );
  }
}