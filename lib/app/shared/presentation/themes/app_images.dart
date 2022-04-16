abstract class AppImages {
  String get boardOne;
  String get boardTwo;
  String get boardThree;
  String get googleIcon;
  String get confirmation;
  String get siren;
  String get joinmeLogo;
  String get gym;
  String get art;
  String get movie;
  String get race;
  String get footbal;
  String get games;
  String get meditation;
  String get technology;
  String get volleyball;
  String get yoga;
  String get music;
  String get studies;
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

  @override
  String get gym => "assets/images/academia.png";

  @override
  String get art => "assets/images/academia.png";

  @override
  String get movie => "assets/images/cinema.png";

  @override
  String get studies => "assets/images/estudos.png";

  @override
  String get race => "assets/images/corrida.png";

  @override
  String get footbal => "assets/images/futebol.png";

  @override
  String get games => "assets/images/jogos.png";

  @override
  String get meditation => "assets/images/meditacao.png";

  @override
  String get technology => "assets/images/tecnologia.png";

  @override
  String get volleyball => "assets/images/volei.png";

  @override
  String get yoga => "assets/images/yoga.png";

  @override
  String get music => "assets/images/music.png";
}
