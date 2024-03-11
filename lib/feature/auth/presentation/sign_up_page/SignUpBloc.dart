import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpContracts.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';
import 'package:get_it/get_it.dart';

import '../../domain/IAuthRepo.dart';

class SignUpBloc extends Bloc<SignUpActions, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on((event, emit) {
      if (event is ChangePasswordVisibilityClick) {
        emit(state.updateState(isPasswordVisible: !state.isPasswordVisible));
      }
      if (event is ChangeRPasswordVisibilityClick) {
        emit(state.updateState(isRPasswordVisible: !state.isRPasswordVisible));
      }
      if (event is NextButtonClick) {
        emit(state.updateState(loadingState: LoadingState.loading));
        _authRepo
            .createUser(
                state.emailController.text, state.passwordController.text)
            .then((value) =>
                emit(state.updateState(loadingState: LoadingState.notLoading)))
            .onError((error, stackTrace) =>
                state.updateState(loadingState: LoadingState.error));
      }
    });
  }

  final IAuthRepo _authRepo = GetIt.I.get<IAuthRepo>();
}
