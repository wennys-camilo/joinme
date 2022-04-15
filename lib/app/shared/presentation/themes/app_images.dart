abstract class AppImages {
  String get boardOne;
  String get boardTwo;
  String get boardThree;
  String get googleIcon;
  String get confirmation;
  String get siren;
  String get joinmeLogo;
}

class AppImagesImpl implements AppImages {
  @override
  String get boardOne => 'assets/images/board1.svg';

  @override
  String get boardTwo => 'assets/images/board2.svg';

  @override
  String get boardThree => 'assets/images/board3.svg';

  @override
  String get googleIcon => 'assets/images/google_icon.svg';

  @override
  String get confirmation => "assets/images/confirmation.svg";

  @override
  String get siren => "assets/images/siren.svg";

  @override
  String get joinmeLogo => "assets/images/joinme_logo.svg";
}
