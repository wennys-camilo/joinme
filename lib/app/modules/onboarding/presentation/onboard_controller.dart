import 'package:flutter_triple/flutter_triple.dart';
import '../../../shared/domain/helpers/errors/failure.dart';
import '../domain/usecases/check_first_acess_usecase.dart';
import '../domain/usecases/set_first_acess_usecase.dart';
import 'onboard_state.dart';

class OnboardController extends StreamStore<Failure, OnboardState> {
  final SetFirstAcessUsecase _setFirstAcessUsecase;
  final CheckFirstAcessUsecase _checkFirstAcessUsecase;
  OnboardController(this._setFirstAcessUsecase, this._checkFirstAcessUsecase)
      : super(OnboardState(firstAcess: false));

  Future<void> load() async {
    var reponse = await _checkFirstAcessUsecase.call();
    await Future.delayed(const Duration(seconds: 2));
    reponse.fold(setError, (result) async {
      update(state.copyWith(firstAcess: result));
    });
  }

  Future<void> setAcess(bool value) async {
    var response = await _setFirstAcessUsecase(value);
    response.fold(setError, (r) {});
  }
}
