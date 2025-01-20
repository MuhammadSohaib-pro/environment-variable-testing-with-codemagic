import 'package:environment_variables_testing_codemagic/environment.dart';
import 'package:environment_variables_testing_codemagic/maincommon.dart';

Future<void> main() async {
  await mainCommon(Environment.dev);
}