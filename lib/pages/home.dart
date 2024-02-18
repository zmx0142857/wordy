import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: ['/tts', '/counter'].map((name) {
            return TextButton(
              onPressed: () => Navigator.pushNamed(context, name),
              child: Text(name),
            );
          }).toList(),
        ),
      ),
    );
  }
}