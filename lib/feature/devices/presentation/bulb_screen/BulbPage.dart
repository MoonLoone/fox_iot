import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:fox_iot/feature/devices/presentation/bulb_screen/BulbPageActions.dart';
import 'package:fox_iot/feature/devices/presentation/bulb_screen/BulbPageBloc.dart';
import 'package:fox_iot/feature/devices/presentation/bulb_screen/BulbPageState.dart';
import 'package:fox_iot/res/components/fox_iot_buttons.dart';

import '../../../../utils/IFoxIoTActions.dart';

class BulbPage extends StatefulWidget {
  static const String navId = "bulb_page";

  @override
  State<StatefulWidget> createState() => _BulbPageState();

}

class _BulbPageState extends State<BulbPage>{
  final circleController = CircleColorPickerController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BulbPageBloc>(context);
    return BlocBuilder<BulbPageBloc, BulbPageState>(builder: (context, state) {
      if (state is InitialBulbState) {
        bloc.add(OnInit<String>(
            arg: ModalRoute.of(context)!.settings.arguments.toString()));
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('Color Picker'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FoxIoTPrimaryButton(
                  btnText: "OnOff",
                  onClick: () => bloc
                      .add(OnOnOffBulbClick(newBulbState: !state.bulbState))),
              SizedBox(
                height: 10.0,
              ),
              FoxIoTPrimaryButton(
                btnText: "ChangeColor",
                onClick: () =>
                    bloc.add(OnColorChange(newColor: circleController.color)),
              ),
              SizedBox(
                height: 10.0,
              ),
              FittedBox(
                child: Row(
                  children: [
                    CircleColorPicker(
                      controller: circleController,
                      onChanged: (Color color) {
                        setState(() {

                        });
                        bloc.add(OnColorChange(newColor: color));
                      },
                      strokeWidth: 10.0,
                      colorCodeBuilder: (context, color) {
                        return Text(
                          'RGB(${color.red},${color.green},${color.blue})',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
