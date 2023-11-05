import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env') //nama file
abstract class Env {
  @EnviedField(varName: 'OPENAI_API_KEY') //nama key
  static String apiKey = _Env.apiKey;
}
