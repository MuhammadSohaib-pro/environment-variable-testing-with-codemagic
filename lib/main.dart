import 'package:environment_variables_testing_codemagic/app_widget.dart';
import 'package:environment_variables_testing_codemagic/environment_variable_service.dart';
import 'package:environment_variables_testing_codemagic/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvironmentVariableService.initialize();
  EnvironmentVariableService.validateConfig();
  MaterialColor primaryColor;
  switch (EnvironmentVariableService.environment) {
    case "dev":
      primaryColor = Colors.blue;
      break;
    case "prod":
      primaryColor = Colors.red;
      break;
    default:
      primaryColor = Colors.yellow;
  }

  setupServiceLocator(primaryColor);
  runApp(const MyApp());
}
