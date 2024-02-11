import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/home/presentation/HomeBloc.dart';
import 'package:fox_iot/feature/home/presentation/contracts/HomePageActions.dart';
import 'package:fox_iot/feature/home/presentation/contracts/HomePageState.dart';
import 'package:fox_iot/feature/home/presentation/painter.dart';
import 'package:fox_iot/res/components/navbar/navbar.dart';
import 'package:fox_iot/res/components/navbar/navbar_states.dart';
import 'package:fox_iot/utils/IFoxIoTActions.dart';

import '../../../res/values/assets.dart';
import '../../../utils/AssetsManipulations.dart';

class HomePage extends StatefulWidget {
  static const String navId = "home_page";

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomePageState>(builder: (context, state) {
      final bloc = BlocProvider.of<HomeBloc>(context);
      FoxIoTAsset changeFabAsset = safetyGetAsset(FoxIotAssetName.changePencil);
      FoxIoTAsset confirmFabAsset = safetyGetAsset(FoxIotAssetName.confirm);
      Image fabImage = state.isChangeModeActive
          ? Image.asset(confirmFabAsset.url)
          : Image.asset(changeFabAsset.url);
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              bloc.add(OnAddRoomClick());
            },
            label: fabImage),
        bottomNavigationBar: FoxNavbar(NavbarStates.home),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return CustomPaint(painter: Painter(false, state.rooms));
          },
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(OnInit());
  }
}
