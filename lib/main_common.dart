import 'package:environment_variables_testing_codemagic/app_widget.dart';
import 'package:environment_variables_testing_codemagic/config_reader.dart';
import 'package:environment_variables_testing_codemagic/environment.dart';
import 'package:environment_variables_testing_codemagic/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();

  MaterialColor primaryColor;
  switch (env) {
    case Environment.dev:
      primaryColor = Colors.blue;
      break;
    case Environment.prod:
      primaryColor = Colors.red;
      break;
    default:
      primaryColor = Colors.yellow;
  }

  setupServiceLocator(primaryColor);

  runApp(const MyApp());
}
