
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/home/domain/IHomeRepo.dart';
import 'package:fox_iot/feature/home/pres/create_home_page/CreateHomeActions.dart';
import 'package:fox_iot/feature/home/pres/create_home_page/CreateHomeState.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';
import 'package:get_it/get_it.dart';

class CreateHomeBloc extends Bloc<CreateHomeActions, CreateHomeState>{

  IHomeRepo homeRepo = GetIt.I.get<IHomeRepo>();

  CreateHomeBloc(): super(CreateHomeState()){
    on((event, emit) {
      if (event is OnConfirmClick) {
        homeRepo.createHome(event.homeName, event.location)
            .then((value) => event.onSuccess())
            .onError((error, stackTrace) =>
            emit(state.updateState(homeName: state.homeName, location: state.location, loadingState: LoadingError(("Error")))));
      }
    });
  }
}
