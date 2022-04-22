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
  String get happy;
  String get motivated;
  String get sad;
  String get bored;
  String get happySelected;
  String get motivatedSelected;
  String get sadSelected;
  String get boredSelected;
  String get savedIcon;
  String get nonSavedIcon;
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
  String get art => "assets/images/artes.png";

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

  @override
  String get happy => "assets/images/feliz.svg";

  @override
  String get sad => "assets/images/triste.svg";

  @override
  String get bored => "assets/images/entediado.svg";

  @override
  String get motivated => "assets/images/motivado.svg";

  @override
  String get happySelected => "assets/images/feliz2.svg";

  @override
  String get sadSelected => "assets/images/triste2.svg";

  @override
  String get boredSelected => "assets/images/entediado2.svg";

  @override
  String get motivatedSelected => "assets/images/motivado2.svg";

  @override
  String get savedIcon => "assets/images/save_event2.svg";

  @override
  String get nonSavedIcon => "assets/images/save_event1.svg";
}
