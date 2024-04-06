
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPActions.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPBloc.dart';
import 'package:fox_iot/feature/devices/presentation/connect_with_ap/ConnectAPState.dart';
import 'package:hive/hive.dart';

class ConnectWithApPage extends StatelessWidget{

  static const String navId = "connect_with_ap";
  final String token;

  ConnectWithApPage(this.token);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ConnectAPBloc>(context);
    return BlocBuilder<ConnectAPBloc, ConnectAPState>(builder: (context, state) {
      if (state is InitialState){
        bloc.add(OnInitWithToken(token));
      }
      return SizedBox();
    });
  }

}
