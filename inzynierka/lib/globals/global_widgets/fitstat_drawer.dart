import 'package:flutter/material.dart';
import 'package:inzynierka/globals/global_widgets/animated_switch_button.dart';

class FitstatDrawer extends StatelessWidget {
  const FitstatDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).highlightColor),
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
                const Positioned(
                    bottom: 5, left: 5, child: Text('Wyloguj/Zaloguj')),
              ],
            ),
          ),
          const ListTile(
            title: Text('Zmień motyw na '),
            trailing: AnimatedSwitchButton(),
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
