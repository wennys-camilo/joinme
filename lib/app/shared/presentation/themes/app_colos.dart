import 'package:flutter/cupertino.dart';

abstract class AppColors {
  Color get grey;
  Color get primary;
  Color get white;
  Color get black;
  Color get transparent;
  Color get greyBoard;
  Color get greyLight;
}

class AppColorsImpl implements AppColors {
  @override
  Color get grey => const Color(0xffC4C4C4);

  @override
  Color get greyLight => const Color(0xffE8E7E3);

  @override
  Color get primary => const Color(0xff493A92);

  @override
  Color get greyBoard => const Color(0xffE8E7E3);

  @override
  Color get white => const Color.fromARGB(255, 255, 255, 255);

  @override
  Color get black => const Color.fromARGB(255, 0, 0, 0);

  @override
  Color get transparent => const Color.fromARGB(0, 0, 0, 0);
}
