import 'package:flutter/material.dart';
import 'package:inzynierka/globals/global_widgets/animated_switch_button.dart';
import 'package:inzynierka/logics/hubs/authentication_service.dart';
import 'package:inzynierka/routes/router.gr.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

class FitstatDrawer extends StatelessWidget {
  const FitstatDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Stack(
              children: [
                Row(children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipOval(
                      child: Image.network(
                          'https://st2.depositphotos.com/1009634/7235/v/950/depositphotos_72350117-stock-illustration-no-user-profile-picture-hand.jpg'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text('Imię Nazwisko'), Text('@username')],
                  ),
                ]),
                Positioned(
                    bottom: 5,
                    left: 5,
                    child: InkWell(
                        onTap: () {
                          Provider.of<AuthenticationService>(context,
                                  listen: false)
                              .signOut();
                        },
                        child: const Text('Wyloguj/Zaloguj'))),
              ],
            ),
          ),
          const ListTile(
            title: Text('Zmień motyw na '),
            trailing: AnimatedSwitchButton(),
          ),
          InkWell(
            onTap: () {
              AutoRouter.of(context).push((const ThemeExampleRoute()));
            },
            child: const ListTile(title: Text('ThemeExampleScreeenGooo ')),
          ),
          // ListTile(
          //   title: Text(
          //     'headline1',
          //     style: Theme.of(context).textTheme.headline1,
          //   ),
          // ),
        ],
      ),
    );
  }
}
