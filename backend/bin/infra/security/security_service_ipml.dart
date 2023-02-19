import 'package:shelf/shelf.dart';
import 'package:shelf/src/middleware.dart';

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
  Future<JWT?> validateJWT(String token) async {
    try {
      String key = await CustomEnv.get(key: 'jwt_key');
      JWTKey secretKey = SecretKey(key);
      return JWT.verify(token, secretKey);
    } on JWTInvalidError catch (e) {
      return null;
    } on JWTExpiredError catch (e) {
      return null;
    } on JWTNotActiveError catch (e) {
      return null;
    } on JWTError catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Middleware get authorization {
    return (Handler handler) {
      return (Request req) async {
        String? authorizationHeader = req.headers['Authorization'];
        JWT? jwt;
        if (authorizationHeader != null) {
          if (authorizationHeader.startsWith('Bearer ')) {
            String token = authorizationHeader.substring(7);
            jwt = await validateJWT(token);
          }
        }
        var requestJWT = req.change(context: {'jwt': jwt});
        return handler(requestJWT);
      };
    };
  }

  //shortcut of above
  @override
  Middleware get verifyJWT {
    return createMiddleware(
      requestHandler: (Request req) {
        if (req.context['jwt'] == null) {
          return Response.forbidden('Not Authorized');
        }
        return null;
      },
    );
  }
}
