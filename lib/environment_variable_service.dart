import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentVariableService {
  static String get fileName =>
      const String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev') == 'prod'
          ? '.env.prod'
          : '.env.dev';

  static String get environment =>
      const String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');

  static Future<void> initialize() async {
    await dotenv.load(fileName: fileName);
  }

  static String get tokelUrl =>
      const String.fromEnvironment('TOKEN_URL', defaultValue: '').isNotEmpty
          ? const String.fromEnvironment('TOKEN_URL')
          : dotenv.env['TOKEN_URL'] ?? '';

  static String get graphqlUrl =>
      const String.fromEnvironment('GRAPHQL_URL', defaultValue: '').isNotEmpty
          ? const String.fromEnvironment('GRAPHQL_URL')
          : dotenv.env['GRAPHQL_URL'] ?? '';

  // Validation method
  static void validateConfig() {
    final missingVars = <String>[];

    if (tokelUrl.isEmpty) missingVars.add('TOKEN_URL');
    if (graphqlUrl.isEmpty) missingVars.add('GRAPHQL_URL');

    if (missingVars.isNotEmpty) {
      throw Exception(
          'Missing required environment variables: ${missingVars.join(', ')}');
    }
  }
}
