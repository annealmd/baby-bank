import '../../core/custom_env.dart';
import 'security_service.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class SercurityServiceIpml implements SecurityService<JWT> {
  @override
  Future<String> generateJWT(String userID) async {
    var jwt = JWT(
      {
        'iat': DateTime.now().millisecondsSinceEpoch,
        'userID': userID,
        'roles': ['user']
      },
    );
    String key = await CustomEnv.get(key: 'jwt_key');
    String token = jwt.sign(SecretKey(key));
    return token;
  }

  @override
  JWT? validateJWT(String token) {
    // TODO: implement validateJWT
    throw UnimplementedError();
  }
}
