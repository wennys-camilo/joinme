import '../../domain/entities/interests_entity.dart';
import '../../domain/entities/user_interests_entity.dart';

abstract class InterestsRemoteDatasource {
  Future<List<InterestsEntity>> fetch();
  Future<void> insert(UserInterestsEntity userInterestsEntity);
}
