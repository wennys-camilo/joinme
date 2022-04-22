import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String image;

  const CircleAvatarWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
          ),
          shape: BoxShape.circle),
    );
  }
}
