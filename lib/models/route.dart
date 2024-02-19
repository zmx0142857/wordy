import 'package:flutter/material.dart';

class RouteItem {
  final String url;
  final String title;
  final Widget Function(BuildContext) import;

  const RouteItem({
    required this.url,
    required this.title,
    required this.import,
  });
}
