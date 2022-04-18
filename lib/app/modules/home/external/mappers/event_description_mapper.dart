import 'package:camp_final/app/modules/home/external/mappers/category_type_mapper.dart';

import '../../domain/entities/address_description_entity.dart';
import '../../domain/entities/event_description_entity.dart';
import 'activities_description_mapper.dart';
import 'address_description_mapper.dart';

class EventDescriptionMapper {
  EventDescriptionEntity to(Map<String, dynamic> map) {
    return EventDescriptionEntity(
      typeImage: CategoryImageTypeMapper().to(map['activities']['name']),
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      isPetFriendly: map['isPetFriendly'] ?? false,
      maxParticipants: map['maxParticipants']?.toInt() ?? 0,
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      isPromoted: map['isPromoted'] ?? false,
      activityId: map['activityId'] ?? '',
      userId: map['userId'] ?? '',
      eventCreatorName: map['users']['name'] ?? '',
      userIdentity: map['userIdentity'] ?? '',
      isOnline: map['isOnline'] ?? false,
      url: map['url'] ?? '',
      createdAt: map['createdAt'] ?? '',
      activities: ActivitiesDescriptionMapper().to(map['activities']),
      addresses: List<AddressDescriptionEntity>.from(
          map['addresses']?.map((x) => AddressDescriptionMapper().to(x))),
      eventAccessibilities: List<dynamic>.from(map['eventAccessibilities']),
      numParticipants: map['numParticipants']?.toInt() ?? 0,
    );
  }
}
