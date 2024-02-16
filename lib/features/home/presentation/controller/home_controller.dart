import 'package:flutter/material.dart';

class HomeController {
  ImageProvider imageProvider = const NetworkImage("https://cataas.com/cat");

  Future<void> clearImageCache() async {
    await imageProvider.evict();
  }
}
