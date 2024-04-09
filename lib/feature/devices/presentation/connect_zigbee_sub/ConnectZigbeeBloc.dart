import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_zigbee_sub/ConnectZigbeeActions.dart';
import 'package:fox_iot/feature/devices/presentation/connect_zigbee_sub/ConnectZigbeeState.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';
import 'package:get_it/get_it.dart';

import '../../domain/IDeviceRepo.dart';

class ConnectZigbeeBloc extends Bloc<IFoxIoTActions, ConnectZigbeeState> {
  final IDeviceRepo _deviceRepo = GetIt.I.get<IDeviceRepo>();

  ConnectZigbeeBloc() : super(const ConnectZigbeeState()) {
    {
      on<OnInit>((event, emit) async {
        emit(state.updateState(loading: const Loading()));
        await _deviceRepo.getGWS().then((value) {
          emit(state.updateState(
              loading: const NotLoading(),
              gws: value,
              currentGW: value.firstOrNull));
        });
      });
      on<OnChangeCurrentGW>((event, emit) async {
        emit(state.updateState(currentGW: event.newGw));
      });
      on<OnStartConnectingClick>((event, emit) async {
        emit(state.updateState(loading: Loading()));
        await _deviceRepo
            .connectZigbeeSub(state.currentGW!.id)
            .then((value) => emit(state.updateState(loading: SuccessLoading())))
            .catchError((err) =>
                emit(state.updateState(loading: LoadingError(err.toString()))));
      });
    }
  }
}
