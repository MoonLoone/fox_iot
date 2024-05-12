import 'package:color_type_converter/exports.dart';

abstract class RoomSquareType extends StatelessWidget {}

class EmptyRoomSquare extends RoomSquareType {
  @override
  Widget build(BuildContext context) => const SizedBox(
        width: double.infinity,
        height: double.infinity,
      );
}

class RoomSquare extends RoomSquareType {
  final String name;
  final Function() onRoomClick;

  RoomSquare(this.name, this.onRoomClick);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(1),
      child: InkWell(
          onTap: () => onRoomClick(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: Center(
              child: Text(name),
            ),
          )));
}

class AddRoomSquare extends RoomSquareType {
  final Function() onClick;

  AddRoomSquare(this.onClick);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(1),
        child: InkWell(
            onTap: () => onClick(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.add, // The "+" icon
                  size: 30, // Adjust the size of the icon
                  color: Colors.black, // Icon color
                ),
              ),
            )),
      );
}
