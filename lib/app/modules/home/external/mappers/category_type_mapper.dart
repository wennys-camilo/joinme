import '../../domain/enums/category_type.dart';

class CategoryImageTypeMapper {
  CategorieType to(String value) {
    switch (value) {
      case "Futebol":
        return CategorieType.football;

      case "Volei":
        return CategorieType.volleyball;

      case "Corrida":
        return CategorieType.race;

      case "Yoga":
        return CategorieType.yoga;

      case "Musica":
        return CategorieType.music;

      case "Arte":
        return CategorieType.art;

      case "Jogos":
        return CategorieType.games;

      case "Estudos":
        return CategorieType.studies;

      case "Tecnologia":
        return CategorieType.technology;

      case "Meditação":
        return CategorieType.meditation;

      case "Academia":
        return CategorieType.gym;

      case "Cinema":
        return CategorieType.movie;

      default:
        throw UnimplementedError();
    }
  }
}
