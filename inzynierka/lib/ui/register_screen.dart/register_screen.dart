import 'dart:developer';

import 'package:flutter/material.dart';

import '../../globals/global_widgets/fitstat_textField.dart';
import '../../logics/hubs/authentication_service.dart';
import '../../helpers/validators.dart';
import '../../routes/router.gr.dart';
import '../../shared/style/fitstat_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController login = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Form(
              key: form,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),

                                ///TODO Dodaj / Podmień Logo na ludzkie
                                child: Image.asset('assets/graphics/logo.png'),
                              ),
                              Text(
                                'Zarejestruj się  ',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FitstatTextField(
                                controller: login,
                                label: 'Podaj adres email',
                                validator: Validators.loginEmailValidator,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FitstatTextField(
                                controller: password,
                                label: 'Podaj hasło',
                                validator: Validators.loginEmailValidator,
                                inputType: TextInputType.visiblePassword,
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 50, top: 0),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: registerTapped,
                            child: const Text('Zarejestruj się')),
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (loading)
              const Center(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      color: FitStatColors.primaryColor,
                    )),
              )
          ],
        ));
  }

  void logInTapped() {
    AutoRouter.of(context).push(const LoginRoute());
  }

  void registerTapped() {
    if (form.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      try {
        Provider.of<AuthenticationService>(context, listen: false)
            .register(login.text, password.text);
      } on FirebaseAuthException catch (e) {
        log(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nie udało się zarejestrować ')));
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }
}
