import 'package:flutter/material.dart';
import 'package:fox_iot/feature/devices/domain/models/DeviceType.dart';
import 'package:fox_iot/feature/devices/presentation/thermo_screen/ThermoEvents.dart';

class ThermoPage extends StatefulWidget {
  static const navId = "thermo_page";

  final String deviceId;

  ThermoPage(this.deviceId);

  @override
  State<StatefulWidget> createState() => _ThermoPageState(deviceId);
}

class _ThermoPageState extends State<ThermoPage> {
  String _thermostatData = "";
  final String deviceId;

  _ThermoPageState(this.deviceId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_thermostatData),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startListening((msg) {
      setState(() {
        _thermostatData = msg.toString();
      });
    }, {"devId": deviceId, "device_type": DeviceType.thermal.name});
  }
}
