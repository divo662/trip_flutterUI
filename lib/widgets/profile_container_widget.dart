import 'package:flutter/material.dart';

class ProfileContainerWidget extends StatelessWidget {
  final String images;
  const ProfileContainerWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
        border: Border.all(
          color: Colors.white,
          width: 2.5,
        ),
          image:  DecorationImage(
              colorFilter: const ColorFilter.mode(
                  Colors.black38, BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage(images))
      ),
    );
  }
}
