import 'package:flutter/material.dart';
import 'package:internal/my_app.dart';
import 'package:palindrome/di/injector.dart';

void main() async {
  await initInjector();
  runApp(const MyApp());
}
