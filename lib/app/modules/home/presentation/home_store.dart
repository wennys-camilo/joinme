import 'package:camp_final/app/shared/store/user/user_store.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../shared/domain/helpers/errors/failure.dart';
import 'home_state.dart';

class HomeStore extends NotifierStore<Failure, HomeState> {
  final UserStore userStore;

  HomeStore(this.userStore) : super(HomeState());
}
