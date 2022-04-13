import '../../domain/entities/accessibilities_entities.dart';
import '../../domain/entities/events_categories_entity.dart';

class AddEventState {
  final List<AccessibilitiesEntity> accessibilities;
  final List<EventCategorieEntity> categories;

  final String eventName;
  final String description;
  final bool isOnline;
  final String url;
  final String date;
  final bool isPetFriendly;
  final int maxParticipants;
  final String startTime;
  final String endTime;
  final EventCategorieEntity? selectedCategorie;
  final double price;
  final String cpforCnpj;
  final List<AccessibilitiesEntity> selectedsAccessibilities;
  final String street;
  final int number;
  final String city;
  final String state;
  final String zipCode;
  final String referencePoint;
  final String userId;
  AddEventState({
    required this.accessibilities,
    required this.categories,
    required this.eventName,
    required this.description,
    required this.isOnline,
    required this.url,
    required this.date,
    required this.isPetFriendly,
    required this.maxParticipants,
    required this.startTime,
    required this.endTime,
    this.selectedCategorie,
    required this.price,
    required this.cpforCnpj,
    required this.selectedsAccessibilities,
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.referencePoint,
    required this.userId,
  });
  //TODO VEREFICAR O CAMPO EVENT ID

  factory AddEventState.empty() {
    return AddEventState(
      isPetFriendly: true,
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
      city: '',
      startTime: '',
      url: '',
      price: 0,
      zipCode: '',
      description: '',
      number: 0,
      state: '',
      date: '',
      userId: '',
      referencePoint: '',
      endTime: '',
      street: '',
    );
  }

  AddEventState copyWith({
    List<AccessibilitiesEntity>? accessibilities,
    List<EventCategorieEntity>? categories,
    String? eventName,
    String? description,
    bool? isOnline,
    String? url,
    String? date,
    bool? isPetFriendly,
    int? maxParticipants,
    String? startTime,
    String? endTime,
    EventCategorieEntity? selectedCategorie,
    double? price,
    String? cpforCnpj,
    List<AccessibilitiesEntity>? selectedsAccessibilities,
    String? street,
    int? number,
    String? city,
    String? state,
    String? zipCode,
    String? referencePoint,
    String? userId,
  }) {
    return AddEventState(
      accessibilities: accessibilities ?? this.accessibilities,
      categories: categories ?? this.categories,
      eventName: eventName ?? this.eventName,
      description: description ?? this.description,
      isOnline: isOnline ?? this.isOnline,
      url: url ?? this.url,
      date: date ?? this.date,
      isPetFriendly: isPetFriendly ?? this.isPetFriendly,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      selectedCategorie: selectedCategorie ?? this.selectedCategorie,
      price: price ?? this.price,
      cpforCnpj: cpforCnpj ?? this.cpforCnpj,
      selectedsAccessibilities:
          selectedsAccessibilities ?? this.selectedsAccessibilities,
      street: street ?? this.street,
      number: number ?? this.number,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      referencePoint: referencePoint ?? this.referencePoint,
      userId: userId ?? this.userId,
    );
  }
}
