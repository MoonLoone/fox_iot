import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/domain/IDeviceRepo.dart';
import 'package:fox_iot/feature/devices/presentation/get_token/GetTokenState.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';
import 'package:get_it/get_it.dart';

import 'GetTokenActions.dart';

class GetTokenBloc extends Bloc<IFoxIoTActions, GetTokenState> {
  final IDeviceRepo repo = GetIt.I.get<IDeviceRepo>();

  GetTokenBloc() : super(const GetTokenState()) {
    {
      on<OnInit>((event, emit) async {
        emit(state.updateState(loadingState: const Loading()));
        await repo.getToken().then((token) {
          if (token != null) {
            emit(state.updateState(
                token: token, loadingState: const NotLoading()));
          }
          else {
            emit(state.updateState(loadingState: LoadingError("token null")));
          }
        });
      });
      on<OnNextClick>((event, emit) async {
        event.navigateNext(state.token!);
      });
      on<OnAbortClick>((event, emit) async {
        event.navigateBack();
      });
    }
  }
}
