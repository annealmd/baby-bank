import 'security_service.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class SercurityServiceIpml implements SecurityService<JWT> {
  @override
  Future<String> generateJWT(String userID) async {
    var jwt = JWT(
      {
        'iat': DateTime.now().millisecondsSinceEpoch,
      },
    );
  }

  @override
  JWT? validateJWT(String token) {
    // TODO: implement validateJWT
    throw UnimplementedError();
  }
}