import 'package:flutter/material.dart';
import 'package:inzynierka/ui/login_screen/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen/home_screen.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = Provider.of<User?>(context);
    if (authenticatedUser == null) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
