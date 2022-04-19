import '../../domain/entities/user_disabilities_entity.dart';

class UserDisabilitiesMapper {
  Map<String, dynamic> to(UserDisabilitiesEntity userDisabilitiesEntity) {
    return {
      'disabilityIds': userDisabilitiesEntity.disabilityIds,
    };
  }
}
