import 'package:flutter/material.dart';

class RoundedImageFromNetwork extends StatelessWidget {
  const RoundedImageFromNetwork({
    Key? key,
    required this.profilePictureHeight,
    required this.photoUrl,
  }) : super(key: key);

  final double profilePictureHeight;
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: profilePictureHeight,
      height: profilePictureHeight,
      decoration: BoxDecoration(
        border: Border.all(
            width: 4, color: Theme.of(context).scaffoldBackgroundColor),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 10))
        ],
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(photoUrl.isEmpty
              ? "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250"
              : photoUrl),
        ),
      ),
    );
  }
}
