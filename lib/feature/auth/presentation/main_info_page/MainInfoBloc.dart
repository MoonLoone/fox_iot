import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/auth/domain/IAuthRepo.dart';
import 'package:fox_iot/local_storage/domain/models/MainUserInfo.dart';
import 'package:fox_iot/utils/models/Response.dart';
import 'package:get_it/get_it.dart';

import '../../../../utils/models/LoadingState.dart';
import 'MainInfoContracts.dart';

class MainInfoBloc extends Bloc<MainInfoActions, MainInfoState> {
  MainInfoBloc() : super(const MainInfoState()) {
    on((event, emit) async {
      if (event is NextClick) {
        final mainUserInfo = MainUserInfo(
            name: event.name, bio: event.bio, avatarUrl: event.imageUrl);
        authRepo
            .sendMainUserInfo(event.userId ?? "", mainUserInfo)
            .then((value) {
          if (value is SuccessResponse) {
            if ((value as SuccessResponse<bool>).data == true) {
              event.navigateNext();
            }
          } else {
            state.updateState(
                loadingState:
                    LoadingError((value as ErrorResponse).error.toString()));
          }
        });
      }
      if (event is AddImageClick) {
        //todo Добавление аватара
      }
      if (event is PreviousClick) {
        event.navigatePrev();
      }
    });
  }

  IAuthRepo authRepo = GetIt.I.get<IAuthRepo>();
}
