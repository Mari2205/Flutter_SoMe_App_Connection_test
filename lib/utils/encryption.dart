import 'package:encrypt/encrypt.dart';

class Encryption {
  // void Aes() {
  //   final plainText = 'hej';
  //   final key = Key.fromBase64('ou9vKhGfY9O2pM1LdeJRvkH2N9CEDeiBSqejN6bD0bg=');
  //   // final iv = IV.fromLength(16);
  //   final iv = IV.fromBase64('YaNGEDkT3P5aGlqQsX+70A==');

  //   final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));

  //   final encrypted = encrypter.encrypt(plainText, iv: iv);
  //   final decrypted = encrypter.decrypt(encrypted, iv: iv);
  //   final decrypted3 = encrypter.decrypt64('tnQsZPtLSozc9afHACJmSw==', iv: iv);
  //   // final decrypted2 = encrypter.decrypt('9jbOECsHZHLKHKbvAt9i4w==', iv: iv);

  //   // dav fra serveren = Ne3C2/VPhSJJ1MGqtkanuA==
  //   print('Decrypted: $decrypted');
  //   print('Encrypted: ${encrypted.base64}');
  // }

  late IV _iv;
  late Encrypter _encrypter;

  Encryption() {
    final key = Key.fromBase64('ou9vKhGfY9O2pM1LdeJRvkH2N9CEDeiBSqejN6bD0bg=');
    _iv = IV.fromBase64('YaNGEDkT3P5aGlqQsX+70A==');

    _encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
  }

  String Decrypt(String msgBase64) {
    final decrypted = _encrypter.decrypt64(msgBase64, iv: _iv);
    return decrypted;
  }

  String Encrypt(String text) {
    final encrypted = _encrypter.encrypt(text, iv: _iv);
    return encrypted.base64;
  }
}
