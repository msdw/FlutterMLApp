
import 'dart:math';

// This would normally be on the server, as your backend.
class PaymentsRepository {
  static Random _random = Random();
  static String actuallyMakeTheCharge(String nonce) {
    // secrets here!
    /* if (_random.nextBool()) {
      return 'Your credit card was declined';
    } */
    // actually make the charge here
    return 'Success!';
  }
}