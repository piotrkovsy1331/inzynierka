import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inzynierka/globals/global_widgets/animated_switch_button.dart';
import 'package:inzynierka/logics/hubs/authentication_service.dart';
import 'package:inzynierka/logics/notifiers/user_data_notifier.dart';
import 'package:inzynierka/routes/router.gr.dart';
import 'package:provider/provider.dart';

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
                Consumer<UserDataNotifier>(
                    builder: (context, userDataNotifier, _) {
                  return Row(children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipOval(
                        child: Image.network(
                            'https://cdn.pixabay.com/photo/2014/12/21/23/39/bananas-575773_1280.png'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userDataNotifier.userData.firstName +
                            " " +
                            userDataNotifier.userData.secondName),
                      ],
                    ),
                  ]);
                }),
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
          InkWell(
            onTap: () {
              AutoRouter.of(context).push((const ProfilePageRoute()));
            },
            child: const ListTile(title: Text('Mój profil')),
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
