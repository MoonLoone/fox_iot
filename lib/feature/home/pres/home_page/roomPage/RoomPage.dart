import 'package:color_type_converter/exports.dart';
import 'package:fox_iot/feature/home/domain/IHomeRepo.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:get_it/get_it.dart';

import '../../../../devices/domain/models/Device.dart';
import '../../../../devices/presentation/devices_list/components/device_extension.dart';
import '../../../../devices/presentation/devices_list/components/device_list_item.dart';

class RoomPage extends StatefulWidget {
  final int roomId;
  static const String navId = "room_page";

  RoomPage(this.roomId);

  @override
  State<StatefulWidget> createState() => _RoomPageState(roomId);
}

class _RoomPageState extends State<RoomPage> {
  final int roomId;
  List<Device> devices = List.empty();

  _RoomPageState(this.roomId);

  @override
  Widget build(BuildContext context) => Background(Center(
        child: _roomDevices(),
      ));

  Widget _roomDevices() => ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
              onTap: getFunctionToDeviceNavigate(devices[index], context),
              child: DeviceListItem(devices[index]));
        },
        itemCount: devices.length,
      );

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  Future getDevices() async {
    devices = await GetIt.I.get<IHomeRepo>().getRoomDevices(roomId);
  }
}
