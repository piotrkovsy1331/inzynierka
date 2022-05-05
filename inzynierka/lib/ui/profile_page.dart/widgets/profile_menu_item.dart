import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.iconSrc,
    required this.title,
  }) : super(key: key);
  final String iconSrc, title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25, width: 25, child: SvgPicture.asset(iconSrc)),
          const SizedBox(width: 10),
          Text(title, style: Theme.of(context).textTheme.headline4),
        ],
      ),
    );
  }
}
