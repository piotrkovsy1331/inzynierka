import 'package:flutter/material.dart';
import 'package:inzynierka/logics/hubs/authentication_service.dart';
import 'package:inzynierka/helpers/validators.dart';
import 'package:inzynierka/routes/router.gr.dart';
import 'package:inzynierka/shared/style/fitstat_colors.dart';
import 'package:provider/provider.dart';
import '../../globals/global_widgets/fitstat_textField.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                                'Zaloguj się ',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FitstatTextField(
                                controller: login,
                                label: 'Login',
                                validator: Validators.loginEmailValidator,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FitstatTextField(
                                controller: password,
                                label: 'Hasło',
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
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10, top: 0),
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: logInTapped,
                              child: const Text('Zaloguj się')),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 0),
                          width: double.infinity,
                          child: OutlinedButton(
                              onPressed: registerTapped,
                              child: const Text('Zarejestruj się ')),
                        ),
                      ]),
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
    if (form.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      try {
        Provider.of<AuthenticationService>(context, listen: false)
            .signIn(login.text, password.text);
      } on FirebaseAuthException catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nie udało się zalogować ')));
      } finally {
        setState(() {
          loading = false;
        });
      }
    }
  }

  void registerTapped() {
    // ignore: prefer_const_constructors
    AutoRouter.of(context).push(RegisterRoute());
  }
}
