import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fox_iot/feature/home/pres/create_home_page/CreateHomePage.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomeBloc.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomeState.dart';
import 'package:fox_iot/feature/home/pres/home_page/components/AddRoomDialog.dart';
import 'package:fox_iot/feature/home/pres/home_page/components/HomeView.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';
import 'package:fox_iot/utils/models/LoadingState.dart';

import '../../../../res/components/background.dart';
import '../../../../res/components/navbar/navbar.dart';
import '../../../../res/components/navbar/navbar_states.dart';
import 'HomeActions.dart';

class HomePage extends StatelessWidget {
  static const String navId = "home_page";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomeState>(builder: (context, state) {
      final bloc = BlocProvider.of<HomePageBloc>(context);
      final isLoading = state.loadingState;
      if (isLoading is Loading) return loadingState(context);
      if (state.homes.isEmpty) {
        return emptyHomesState(
            context,
            () => bloc.add(OnCreateHomeClick(
                () => Navigator.pushNamed(context, CreateHomePage.navId))));
      }
      return home(
          state,
          (selectedHomeName) => bloc.add(ChangeHome(selectedHomeName)),
          () => bloc.add(OnChangeHomeClick()),
          () => bloc.add(OnEditHomeClick()),
          (roomId) => bloc.add(OnRoomClick(roomId)),
          bloc);
    });
  }

  Widget loadingState(BuildContext context) => Background(Scaffold(
      backgroundColor: Colors.amber.withOpacity(0),
      bottomNavigationBar: FoxNavbar(
        NavbarStates.home,
      ),
      body: const Center(child: CircularProgressIndicator())));

  Widget emptyHomesState(BuildContext context, Function addRoom) =>
      Background(Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: FoxNavbar(
            NavbarStates.home,
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "You should create",
                style: FoxIotTheme.textStyles.h4,
              ),
              Text(
                "new house",
                style: FoxIotTheme.textStyles.h4,
              ),
              const SizedBox(height: 32),
              SvgPicture.asset(safetyGetAsset(FoxIotAssetName.room).url,
                  width: 128, height: 128),
              const SizedBox(height: 32),
              FoxIoTPrimaryButton(
                  btnText: "Create house", onClick: () => addRoom())
            ],
          ))));

  Widget home(
      HomeState state,
      Function(String) changeHome,
      Function onSelectHomeClick,
      Function onEditClick,
      Function(int) onRoomClick,
      HomePageBloc bloc) {
    return Background(Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: FoxNavbar(
        NavbarStates.home,
      ),
      body: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 32, top: 56),
                  child: Column(children: [
                    FloatingActionButton(
                        shape: const CircleBorder(),
                        backgroundColor: FoxIotTheme.colors.fourth,
                        onPressed: () {
                          onSelectHomeClick();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            safetyGetAsset(FoxIotAssetName.home).url,
                            width: 48,
                            height: 48,
                            color: Colors.white,
                          ),
                        )),
                  ]))),
          if (state.isSelectHome)
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 120, top: 56),
                  child: DropdownButton<String>(
                    value: state.currentHome?.name,
                    items: state.homes
                        .map<DropdownMenuItem<String>>(
                            (home) => DropdownMenuItem<String>(
                                  value: home.name,
                                  child: Text(home.name),
                                ))
                        .toList(),
                    onChanged: (String? value) {
                      if (value != null) {
                        changeHome(value);
                      }
                    },
                  ),
                )),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 32, bottom: 40),
              child: FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: FoxIotTheme.colors.fourth,
                  onPressed: () {
                    onEditClick();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      safetyGetAsset(FoxIotAssetName.pencil).url,
                      width: 48,
                      height: 48,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
          HomeView(bloc, state),
          if (state.isAddRoomDialog != null)
            AddRoomDialog((name) => bloc.add(ApplyCreateRoomDialog(name)))
        ],
      ),
    ));
  }
}
