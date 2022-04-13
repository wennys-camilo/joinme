import 'package:camp_final/app/shared/store/user/user_store.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:intl/intl.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/accessibilities_entities.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/entities/event_address_entity.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/entities/events_categories_entity.dart';
import '../../domain/usecases/create_event_usecase.dart';
import '../../domain/usecases/fetch_accessibilities_events_usecase.dart';
import '../../domain/usecases/fetch_categories_event_usecase.dart';
import 'add_event_state.dart';

class AddEventStore extends StreamStore<Failure, AddEventState> {
  final FetchAccessibilitiesEventsUsecase _fetchAccessibilitiesEventsUsecase;
  final FetchCategorieEventUsecase _fetchCategorieEventUsecase;
  final CreateEventUsecase _createEventUsecase;
  final UserStore userStore;

  AddEventStore(
      this._fetchAccessibilitiesEventsUsecase,
      this._fetchCategorieEventUsecase,
      this._createEventUsecase,
      this.userStore)
      : super(AddEventState.empty());

  onChangeName(String value) {
    update(state.copyWith(eventName: value));
  }

  onChangeDescription(String value) {
    update(state.copyWith(description: value));
  }

  onChangemodalityEvent(bool value) {
    update(state.copyWith(isOnline: value));
  }

  onChangeDate(DateTime value) {
    update(state.copyWith(date: DateFormat('MM/dd/yyyy').format(value)));
  }

  onChangeisPetFriendly(bool value) {
    update(state.copyWith(isPetFriendly: value));
  }

  onChangeMaxParticipants(String value) {
    update(state.copyWith(maxParticipants: int.parse(value)));
  }

  onChangeStartTime(DateTime value) {
    update(state.copyWith(startTime: DateFormat.Hm().format(value)));
  }

  onChangeEndTime(DateTime value) {
    update(state.copyWith(endTime: DateFormat.Hm().format(value)));
  }

  onChangeSelectedsAccessibilities(List<AccessibilitiesEntity> value) {
    update(state.copyWith(selectedsAccessibilities: value));
  }

  onChangeCategorie(EventCategorieEntity value) {
    update(state.copyWith(selectedCategorie: value));
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
      ]));
      for (var element in state.categories) {
        if (element.id == "001") {
          update(state.copyWith(selectedCategorie: element));
        }
      }
    });
  }

  Future<void> createEvent() async {
    final response = await _createEventUsecase(
      EventAddressEntity(
        event: EventEntity(
          activityId: "76e56e1a-c5fb-451b-b49c-0019258383dc",
          date: '2022-04-22',
          description: "Evento online teste",
          isOnline: true,
          isPetFriendly: true,
          maxParticipants: 20,
          name: 'Any name',
          price: 99.99,
          startTime: '15:00',
          userIdentity: '66332545445',
          url: 'https://teste.com.br',
          //endTime: state.endTime,
        ),
        address: !state.isOnline
            ? AddressEntity(
                number: 01,
                state: 'SP',
                street: 'RUA 18',
                zipCode: '75909260',
                city: 'São Paulo',
                userId: '41b63cc0-ed43-42c3-8ff9-af30bf1d8cb3',
              )
            : null,
      ),
    );

    response.fold(setError, (result) {});
  }
}
