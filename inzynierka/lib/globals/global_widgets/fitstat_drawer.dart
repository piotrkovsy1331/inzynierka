import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inzynierka/globals/global_widgets/animated_switch_button.dart';
import 'package:inzynierka/logics/hubs/authentication_service.dart';
import 'package:inzynierka/logics/notifiers/app_theme_notifier.dart';
import 'package:inzynierka/logics/notifiers/user_data_notifier.dart';
import 'package:inzynierka/routes/router.gr.dart';
import 'package:inzynierka/ui/profile_page.dart/widgets/rounded_image_from_network.dart';
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
                    RoundedImageFromNetwork(
                      photoUrl: userDataNotifier.userData.photoUrl!,
                      profilePictureHeight: 70,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          userDataNotifier.userData.firstName +
                              " " +
                              userDataNotifier.userData.secondName,
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    fontSize: 20,
                                  ),
                        ),
                      ],
                    ),
                  ]);
                }),
                Positioned(
                    top: 3,
                    right: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                          onTap: () {
                            Provider.of<AuthenticationService>(context,
                                    listen: false)
                                .signOut();
                          },
                          child: const Text('Wyloguj')),
                    )),
              ],
            ),
          ),
          Consumer<AppThemeNotifier>(builder: (context, appTmemeNotifier, _) {
            return ListTile(
              title: Text(
                  appTmemeNotifier.darkTheme
                      ? 'Włacz Tryb Jasny'
                      : 'Włacz Tryb Ciemny  ',
                  style: Theme.of(context).textTheme.headline4!),
              trailing: AnimatedSwitchButton(themeChange: appTmemeNotifier),
            );
          }),
          InkWell(
            onTap: () {
              AutoRouter.of(context).push((const ThemeExampleRoute()));
            },
            child: ListTile(
                title: Text('ThemeExampleScreeenGooo ',
                    style: Theme.of(context).textTheme.headline4!)),
          ),
          InkWell(
            onTap: () {
              AutoRouter.of(context).push((const ProfilePageRoute()));
            },
            child: ListTile(
                title: Text('Mój profil',
                    style: Theme.of(context).textTheme.headline4!)),
          ),
        ],
      ),
    );
  }
}
