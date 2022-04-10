import 'package:camp_final/app/modules/home/submodules/events/pages/add_events/teste.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import 'add_event_state.dart';

class AddEventStore extends StreamStore<Failure, AddEventState> {
  AddEventStore()
      : super(AddEventState(isPetFriendly: 0, teste: [
          Teste(id: 0, name: 'teste1'),
          Teste(id: 1, name: 'teste2'),
          Teste(id: 3, name: 'teste3'),
          Teste(id: 4, name: 'teste4'),
        ]));

  onChangeisPetFriendly(int value) {
    update(state.copyWith(isPetFriendly: value));
  }
}
