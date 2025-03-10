// lib/service_locator.dart
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator(MaterialColor primaryColor) {
  getIt.registerSingleton<MaterialColor>(primaryColor);
}
