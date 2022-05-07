import 'dart:io';
import 'package:flutter/material.dart';

class RoundedImageFromFile extends StatelessWidget {
  const RoundedImageFromFile({
    Key? key,
    required this.profilePictureHeight,
    required this.profileImagePicked,
  }) : super(key: key);

  final double profilePictureHeight;
  final File? profileImagePicked;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: profilePictureHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          border: Border.all(
            width: 5,
            color: const Color.fromARGB(255, 255, 253, 253),
          ),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 10))
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(80.0),
            child: Image.file(
              profileImagePicked!,
              fit: BoxFit.cover,
            )));
  }
}
