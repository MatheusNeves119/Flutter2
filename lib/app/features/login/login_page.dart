import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puc_minas/app/core/constants/app_assets.dart';
import 'package:puc_minas/app/core/constants/app_routes.dart';
import 'package:puc_minas/app/features/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cpfEC = TextEditingController();
  final passwordEC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(AppAssets.logo),
                TextFormField(
                  controller: cpfEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Este campo é obrigatorio'),
                    Validatorless.min(6, 'o Minimo de caracteres é 6'),
                  ]),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, CpfInputFormatter()],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'insira seu CPF'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordEC,
                  validator: Validatorless.multiple([Validatorless.required('A senha esta invalida'), Validatorless.min(6, 'O numero minimo de caracteres é 6')]),
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(hintText: 'insira uma Senha'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      bool valid = formKey.currentState?.validate() ?? false;

                      if (valid) {
                        LoginController.login(cpf: '12298111685', password: 'corinthians');
                        (Navigator.of(context).pushNamed(AppRoutes.home));
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_card),
                        Text('ACESSAR'),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
