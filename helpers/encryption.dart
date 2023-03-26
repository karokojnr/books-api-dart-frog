import 'package:encrypt/encrypt.dart';

import '../config/config.dart';

class Encryption {
  static Encrypted encrypt(String secret) {
    const aesKey = Config.aesKey;
    const aesIv = Config.aesIv;
    final key = Key.fromBase64(aesKey);
    final iv = IV.fromBase64(aesIv);

    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(secret, iv: iv);

    return encrypted;
  }
}
