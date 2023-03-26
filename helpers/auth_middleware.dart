import 'package:dart_frog/dart_frog.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../config/config.dart';

Middleware authorize() {
  return provider<bool>((context) {
    final request = context.request;
    final headers = request.headers;
    final authData = headers['Authorization'];
    try {
      final token = authData!.trim();
      verifyJwtHS256Signature(
        token,
        Config.jwtSecret,
      );
      return true;
    } catch (e) {
      return false;
    }
  });
}
