import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/auth/domain/IAuthRepo.dart';
import 'package:fox_iot/auth/sign_in_page/SignInContracts.dart';
import 'package:get_it/get_it.dart';

class SignInBloc extends Bloc<SignInEvents, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on((event, emit) {
      if (event is VisibleIconClick) {
        emit(state.updateState(isPasswordVisible: !state.isPasswordVisible));
      }
      if (event is SignInClick) {
        emit(state.updateState(loadingState: LoadingState.loading));
      }
      if (event is ForgotPasswordClick) {
        emit(state.updateState());
      }
    });
  }

  IAuthRepo authRepo = GetIt.I.get<IAuthRepo>();
}
