import 'package:flutter/material.dart';

class FitStatAppBar extends StatelessWidget with PreferredSizeWidget {
  const FitStatAppBar({
    Key? key,
    required this.title,
    this.trailing,
  }) : super(key: key);
  final String title;
  final Widget? trailing;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: trailing != null ? [trailing!] : null,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
