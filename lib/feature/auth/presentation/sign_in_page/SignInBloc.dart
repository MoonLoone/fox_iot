import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/auth/domain/IAuthRepo.dart';
import 'package:get_it/get_it.dart';

import '../../../../utils/models/LoadingState.dart';
import 'SignInContracts.dart';

class SignInBloc extends Bloc<SignInActions, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on((event, emit) async {
      if (event is VisibleIconClick) {
        emit(state.updateState(isPasswordVisible: !state.isPasswordVisible));
      }
      if (event is SignInClick) {
        emit(state.updateState(loadingState: const Loading()));
        if (event.email == null || event.password == null) return;
        await authRepo
            .authorizeWithEmail(event.email!, event.password!)
            .then((value) => event.navigateWhenAuth!(), );
      }
      if (event is ForgotPasswordClick) {
        emit(state.updateState());
      }
    });
  }

  IAuthRepo authRepo = GetIt.I.get<IAuthRepo>();
}
