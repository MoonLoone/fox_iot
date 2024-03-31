
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/home/pres/create_home_page/CreateHomeActions.dart';
import 'package:fox_iot/feature/home/pres/create_home_page/CreateHomeBloc.dart';
import 'package:fox_iot/feature/home/pres/create_home_page/CreateHomeState.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomePage.dart';
import 'package:fox_iot/res/components/FoxTextFields.dart';

import '../../../../res/components/background.dart';

class CreateHomePage extends StatelessWidget {
  static const String navId = "create_home_page";

  final TextEditingController homeNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateHomeBloc, CreateHomeState>(builder: (context, state) {
      final bloc = BlocProvider.of<CreateHomeBloc>(context);
      return Background(Scaffold(
        backgroundColor: Colors.amber.withOpacity(0),
        body: Column(
          children: [
            FoxIoTTextField(
              controller: homeNameController,
            ),
            FoxIoTTextField(
              controller: locationController,
            ),
            TextButton(onPressed: () => bloc.add(OnConfirmClick(onSuccess: () => Navigator.pushNamed(context, HomePage.navId), homeName: homeNameController.text, location: locationController.text)), child: Text("Create home"),),

          ],
        )
      ));
    });
  }

}
