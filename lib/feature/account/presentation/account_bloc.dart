import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/account/presentation/contracts/account_actions.dart';
import 'package:fox_iot/feature/account/presentation/contracts/account_state.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';

class AccountBloc extends Bloc<AccountActions, AccountState> {
  AccountBloc() : super(const AccountState()) {
    on((event, emit) {
      switch (event) {
        case OnExitClick:
          {}
        case OnSupportClick:
          {}
        case OnFamilyClick:
          {}
        case OnBackClick:
          {}
        case OnSettingsClick:
          {}
        case OnAccountImageClick:
          {}
      }
    });
  }
}
