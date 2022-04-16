import 'package:camp_final/app/modules/home/domain/enums/category_type.dart';

import 'activities_description_entity.dart';
import 'address_description_entity.dart';

class EventDescriptionEntity {
  final String id;
  final String name;
  final String description;
  final String date;
  final bool isPetFriendly;
  final int maxParticipants;
  final String startTime;
  final int price;
  final bool isPromoted;
  final String activityId;
  final String userId;
  final String userIdentity;
  final bool isOnline;
  final String url;
  final String createdAt;
  final ActivitiesDescriptionEntity activities;
  final List<AddressDescriptionEntity> addresses;
  final List<dynamic> eventAccessibilities;
  final int numParticipants;
  final CategorieType typeImage;
  EventDescriptionEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.isPetFriendly,
    required this.maxParticipants,
    required this.startTime,
    required this.price,
    required this.isPromoted,
    required this.activityId,
    required this.userId,
    required this.userIdentity,
    required this.isOnline,
    required this.url,
    required this.createdAt,
    required this.activities,
    required this.addresses,
    required this.eventAccessibilities,
    required this.numParticipants,
    required this.typeImage,
  });
}
