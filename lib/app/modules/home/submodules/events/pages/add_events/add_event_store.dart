import 'package:flutter_triple/flutter_triple.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/accessibilities_entities.dart';
import '../../domain/entities/events_categories_entity.dart';
import '../../domain/usecases/fetch_accessibilities_events_usecase.dart';
import '../../domain/usecases/fetch_categories_event_usecase.dart';
import 'add_event_state.dart';

class AddEventStore extends StreamStore<Failure, AddEventState> {
  final FetchAccessibilitiesEventsUsecase _fetchAccessibilitiesEventsUsecase;

  final FetchCategorieEventUsecase _fetchCategorieEventUsecase;

  AddEventStore(
      this._fetchAccessibilitiesEventsUsecase, this._fetchCategorieEventUsecase)
      : super(AddEventState.empty());

  onChangeisPetFriendly(int value) {
    update(state.copyWith(isPetFriendly: value));
  }

  onChangeMaxParticipants(double value) {
    update(state.copyWith(maxParticipants: value.toInt()));
  }

  onChangemodalityEvent(bool value) {
    update(state.copyWith(isOnline: value));
  }

  onChangeSelectedsAccessibilities(List<AccessibilitiesEntity> value) {
    update(state.copyWith(selectedsAccessibilities: value));
  }

  onChangeCategorie(EventCategorieEntity value) {
    update(state.copyWith(selectedCategorie: value));
  }

  onChangeName(String value) {
    update(state.copyWith(eventName: value));
  }

  onChangeCpforCnpj(String value) {
    update(state.copyWith(cpforCnpj: value));
  }

  onChangemMaxParticipants(String value) {
    update(state.copyWith(maxParticipants: int.parse(value)));
  }

  Future<void> accessibilities() async {
    final response = await _fetchAccessibilitiesEventsUsecase();
    response.fold(setError, (result) {
      update(state.copyWith(accessibilities: result));
    });
    print(state.accessibilities.first.id);
  }

  Future<void> categories() async {
    final response = await _fetchCategorieEventUsecase();
    response.fold(setError, (result) {
      update(state.copyWith(categories: [
        EventCategorieEntity(
            active: true, name: 'Selecione uma Categoria', id: "001"),
        ...result
      ], selectedCategorie: result.first));
    });
  }
}
