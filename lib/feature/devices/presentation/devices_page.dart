import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/devices/presentation/contracts/devices_state.dart';
import 'package:fox_iot/feature/devices/presentation/devices_bloc.dart';

class DevicesPage extends StatefulWidget {
  static const String navId = "devices_page";

  @override
  State<StatefulWidget> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicesBloc, DevicesState>(builder: (context, state) {
      return Scaffold();
    });
  }
}
