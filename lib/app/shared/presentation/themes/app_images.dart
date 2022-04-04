abstract class AppImages {
  String get boardOne;
  String get boardTwo;
  String get boardThree;
}

class AppImagesImpl implements AppImages {
  @override
  String get boardOne => 'assets/images/board1.svg';

  @override
  String get boardTwo => 'assets/images/board2.svg';

  @override
  String get boardThree => 'assets/images/board3.svg';
}
