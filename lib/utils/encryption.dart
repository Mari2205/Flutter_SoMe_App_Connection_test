import 'package:fast_rsa/fast_rsa.dart';

class Encryption {
  void rsa() async {
    var resultEncrypt = await RSA.encryptPKCS1v15('message', 'publicKey');

    var resultDecrypt = await RSA.decryptPKCS1v15('ciphertext', 'privateKey');
  }
}
