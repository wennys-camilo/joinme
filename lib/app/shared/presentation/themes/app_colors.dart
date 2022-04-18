import 'package:flutter/cupertino.dart';

abstract class AppColors {
  Color get grey;
  Color get primary;
  Color get white;
  Color get black;
  Color get transparent;
  Color get greyBoard;
  Color get greyLight;
  Color get blueLight;
  Color get pink;
  Color get green;
  Color get red;
  Color get neutralDark;
  Color get logoBlue;
}

class AppColorsImpl implements AppColors {
  @override
  Color get grey => const Color(0xffC4C4C4);

  @override
  Color get greyLight => const Color(0xffE8E7E3);

  @override
  Color get primary => const Color(0xff1A00D0);

  @override
  Color get greyBoard => const Color(0xffE8E7E3);

  @override
  Color get white => const Color.fromARGB(255, 255, 255, 255);

  @override
  Color get black => const Color.fromARGB(255, 0, 0, 0);

  @override
  Color get transparent => const Color.fromARGB(0, 0, 0, 0);

  @override
  Color get blueLight => const Color(0xffDEDAF0);

  @override
  Color get pink => const Color(0xffDF3083);

  @override
  Color get green => const Color(0xff00B200);

  @override
  Color get red => const Color.fromARGB(255, 255, 0, 0);

  @override
  Color get neutralDark => const Color(0xff757678);

  @override
  Color get logoBlue => const Color(0xff1E00FC);
}
