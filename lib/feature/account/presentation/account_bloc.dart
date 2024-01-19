import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/account/presentation/contracts/account_actions.dart';
import 'package:fox_iot/feature/account/presentation/contracts/account_state.dart';

class AccountBloc extends Bloc<AccountActions, AccountState> {
  AccountBloc() : super(const AccountState()) {
    on((event, emit) {
      //if (event is LoadDevices)
    });
  }
}
