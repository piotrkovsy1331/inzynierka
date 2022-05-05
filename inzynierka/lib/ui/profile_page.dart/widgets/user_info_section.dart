import 'package:flutter/material.dart';
import 'package:inzynierka/ui/profile_page.dart/widgets/profile_menu_item.dart';

class UserInfoSection extends StatelessWidget {
  UserInfoSection(
      {Key? key,
      required this.heightValue,
      required this.weightValue,
      required this.ageValue,
      required this.dailyCaloriesLimit})
      : super(key: key);
  late double heightValue = 0;
  late double weightValue = 0;
  late double ageValue = 0;
  late double dailyCaloriesLimit = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileMenuItem(
            iconSrc: "assets/icons/weight.svg",
            title: weightValue.toInt().toString() + " kg",
          ),
          const SizedBox(
            height: 30,
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/age.svg",
            title: ageValue.toInt().toString() + " lata",
          ),
          const SizedBox(
            height: 30,
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/height.svg",
            title: heightValue.toInt().toString() + " cm",
          ),
          const SizedBox(
            height: 30,
          ),
          ProfileMenuItem(
              iconSrc: "assets/icons/bowl.svg",
              title: dailyCaloriesLimit.toInt().toString() + " kcal"),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
