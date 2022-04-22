import 'package:camp_final/app/modules/forgot_password/domain/usecases/reset_password_usecase.dart';
import 'package:camp_final/app/modules/forgot_password/presentation/forgot_password_state.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../shared/domain/helpers/errors/failure.dart';

class ForgotPasswordStore extends StreamStore<Failure, ForgotPasswordState> {
  final ResetPasswordUsecase _resetPasswordUsecase;

  ForgotPasswordStore(this._resetPasswordUsecase)
      : super(ForgotPasswordState(email: ''));

  onChangeEmail(String value) {
    update(state.copyWith(email: value));
  }

  Future<void> reset() async {
    final response = await _resetPasswordUsecase(state.email);
    response.fold(setError, (result) {
      update(state.copyWith());
    });
  }
}
