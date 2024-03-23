import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/auth/domain/models/FoxIoTUser.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpContracts.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';
import 'package:fox_iot/utils/models/Response.dart';
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
        emit(state.updateState(loadingState: const Loading()));
        _authRepo.createAuthUser(event.email!, event.password!).then((value) {
          if (value is SuccessResponse) {
            event.onCreateNavigate(
                (value as SuccessResponse<AuthUserDTO>).data?.uid ?? "");
          }
          if (value is ErrorResponse) {
            state.updateState(
                loadingState:
                    LoadingError((value as ErrorResponse).error.toString()));
          }
        }).onError((error, stackTrace) {
          state.updateState(loadingState: LoadingError(error.toString()));
        });
      }
    });
  }

  final IAuthRepo _authRepo = GetIt.I.get<IAuthRepo>();
}
