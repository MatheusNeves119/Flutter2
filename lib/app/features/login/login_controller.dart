import 'package:flutter_animate/flutter_animate.dart';

class LoginController {
static  Future<bool> login({
    required String cpf,
    required String password,
  }) async {
    await Future.delayed(3.seconds);

    return true;
  }
}
