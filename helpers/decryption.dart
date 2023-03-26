import 'package:encrypt/encrypt.dart';

import '../config/config.dart';

class Decryption {
  static String decrypt(String secret) {
    var key = Key.fromLength(32);
    var iv = IV.fromLength(16);
    key = Key.fromBase64(Config.aesKey);
    iv = IV.fromBase64(Config.aesIv);
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt(Key.fromBase64(secret), iv: iv);
    return decrypted;
  }
}
