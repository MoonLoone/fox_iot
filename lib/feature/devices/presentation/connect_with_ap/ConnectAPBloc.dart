import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPActions.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPState.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';
import 'package:get_it/get_it.dart';

import '../../domain/IDeviceRepo.dart';

class ConnectAPBloc extends Bloc<IFoxIoTActions, ConnectAPState> {
  final IDeviceRepo repo = GetIt.I.get<IDeviceRepo>();

  ConnectAPBloc() : super(InitialState()) {
    {
      on<OnInitWithToken>((event, emit) async {
        emit(state.updateState(token: event.token));
      });
      on<ConnectClick>((event, emit) async {
        repo.connectUsingAP(state.token, event.wifiPassword, event.wifiName);
      });
    }
  }
}
