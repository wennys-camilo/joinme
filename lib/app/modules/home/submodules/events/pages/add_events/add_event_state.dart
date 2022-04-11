import '../../domain/entities/accessibilities_entities.dart';
import '../../domain/entities/events_categories_entity.dart';

class AddEventState {
  final int isPetFriendly;
  final List<AccessibilitiesEntity> accessibilities;
  final List<AccessibilitiesEntity> selectedsAccessibilities;
  final List<EventCategorieEntity> categories;
  final bool isOnline;
  final int maxParticipants;
  final EventCategorieEntity? selectedCategorie;
  final String eventName;
  final String cpforCnpj;
  final int numParticipants;

  AddEventState({
    required this.isPetFriendly,
    required this.accessibilities,
    required this.selectedsAccessibilities,
    required this.categories,
    required this.isOnline,
    required this.maxParticipants,
    required this.selectedCategorie,
    required this.eventName,
    required this.cpforCnpj,
    required this.numParticipants,
  });

  factory AddEventState.empty() {
    return AddEventState(
      isPetFriendly: 1,
      accessibilities: [],
      selectedsAccessibilities: [],
      categories: [
        EventCategorieEntity(
            active: true, name: 'Selecione uma Categoria', id: "001")
      ],
      isOnline: false,
      maxParticipants: 0,
      selectedCategorie: null,
      eventName: '',
      cpforCnpj: '',
      numParticipants: 0,
    );
  }

  AddEventState copyWith({
    int? isPetFriendly,
    List<AccessibilitiesEntity>? accessibilities,
    List<AccessibilitiesEntity>? selectedsAccessibilities,
    List<EventCategorieEntity>? categories,
    bool? isOnline,
    int? maxParticipants,
    EventCategorieEntity? selectedCategorie,
    String? eventName,
    String? cpforCnpj,
    int? numParticipants,
  }) {
    return AddEventState(
      isPetFriendly: isPetFriendly ?? this.isPetFriendly,
      accessibilities: accessibilities ?? this.accessibilities,
      selectedsAccessibilities:
          selectedsAccessibilities ?? this.selectedsAccessibilities,
      categories: categories ?? this.categories,
      isOnline: isOnline ?? this.isOnline,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      selectedCategorie: selectedCategorie ?? this.selectedCategorie,
      eventName: eventName ?? this.eventName,
      cpforCnpj: cpforCnpj ?? this.cpforCnpj,
      numParticipants: numParticipants ?? this.numParticipants,
    );
  }
}
