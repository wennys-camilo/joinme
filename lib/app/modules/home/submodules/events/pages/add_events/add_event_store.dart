import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:intl/intl.dart';
import '../../../../../../shared/store/user/user_store.dart';
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
    List<String> ids = [];
    for (var accessibilite in value) {
      ids.add(accessibilite.id);
    }
    update(state.copyWith(
        selectedsAccessibilities: value, selectedsIdsAccessibilities: ids));
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

  onChangePrice(String value) {
    update(state.copyWith(
        price:
            double.parse(value.replaceFirst('.', '').replaceFirst(',', '.'))));
  }

  onChangeUrl(String value) {
    update(state.copyWith(url: value));
  }

  onChangeStreet(String value) {
    update(state.copyWith(street: value));
  }

  onChangeNumber(String value) {
    update(state.copyWith(number: int.parse(value)));
  }

  onChangeCity(String value) {
    update(state.copyWith(city: value));
  }

  onChangeState(String value) {
    update(state.copyWith(state: value));
  }

  onChangeZipCode(String value) {
    update(state.copyWith(zipCode: value));
  }

  onChangeReferencePoint(String value) {
    update(state.copyWith(referencePoint: value));
  }

  onChangeisFree(bool value) {
    update(state.copyWith(isFree: value));
  }

  Future<void> accessibilities() async {
    final response = await _fetchAccessibilitiesEventsUsecase();
    response.fold(setError, (result) {
      update(state
          .copyWith(accessibilities: result, selectedsIdsAccessibilities: []));
    });
  }

  Future<void> categories() async {
    final response = await _fetchCategorieEventUsecase();
    response.fold(setError, (result) {
      update(
        state.copyWith(
          categories: [
            EventCategorieEntity(
                active: true, name: 'Categoria do evento', id: "CATEGORIA"),
            ...result
          ],
        ),
      );
      for (var element in state.categories) {
        if (element.id == "CATEGORIA") {
          update(state.copyWith(selectedCategorie: element));
        }
      }
    });
  }

  Future<void> createEvent() async {
    setLoading(true);
    final response = await _createEventUsecase(
      EventAddressEntity(
        event: EventEntity(
          activityId: state.selectedCategorie!.id,
          date: state.date,
          description: state.description,
          isOnline: state.isOnline,
          isPetFriendly: state.isPetFriendly,
          maxParticipants: state.maxParticipants,
          name: state.eventName,
          price: state.isFree ? 0.0 : state.price,
          startTime: state.startTime,
          userIdentity: state.cpforCnpj,
          url: state.url,
          endTime: state.endTime,
          accessibilities: state.selectedsIdsAccessibilities,
        ),
        address: !state.isOnline
            ? AddressEntity(
                number: state.number,
                state: state.state,
                street: state.street,
                zipCode: state.zipCode,
                city: state.city,
                referencePoint: state.referencePoint)
            : null,
      ),
    );
    response.fold(setError, (result) {
      update(state.copyWith(eventAddedSucess: true));
      Timer(const Duration(seconds: 2), () {
        Modular.to.navigate('/home/homePage');
      });
    });
    setLoading(false);
  }
}
