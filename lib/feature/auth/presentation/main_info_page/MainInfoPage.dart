import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpPage.dart';
import 'package:fox_iot/feature/home/pres/home_page/HomePage.dart';
import 'package:fox_iot/res/components/FoxTextFields.dart';
import 'package:fox_iot/res/components/background.dart';
import 'package:fox_iot/res/values/assets.dart';
import 'package:fox_iot/res/values/theme.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';

import '../../../../res/values/s.dart';
import '../components/NavigationAnimateRow.dart';
import 'MainInfoBloc.dart';
import 'MainInfoContracts.dart';

class MainInfoPage extends StatefulWidget {
  static const String navId = "main_info_page";

  @override
  State<StatefulWidget> createState() => MainInfoPageState();
}

class MainInfoPageState extends State<MainInfoPage> {
  final TextEditingController bioController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainInfoBloc, MainInfoState>(builder: (context, state) {
      final String? userUID = (ModalRoute.of(context)?.settings.arguments
          as Map<String, String>)["userId"];
      final imageUrl = state.imageUrl;
      final loading = state.loadingState;
      final MainInfoBloc mainInfoBloc = BlocProvider.of<MainInfoBloc>(context);
      return Background(Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.amber.withOpacity(0),
          body: Stack(children: [
            FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: FoxIotTheme.colors.tint)),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 60, right: 32, left: 32, bottom: 32),
                child: Center(
                    child: Column(children: [
                  _TopText(),
                  NavigationAnimateRow(
                      () => mainInfoBloc.add(PreviousClick(navigatePrev: () {
                            Navigator.pushNamed(context, SignUpPage.navId);
                          })),
                      () => mainInfoBloc.add(NextClick(
                          navigateNext: () {
                            Navigator.pushNamed(context, HomePage.navId);
                          },
                          name: nameController.text,
                          bio: bioController.text,
                          userId: userUID))),
                  const SizedBox(height: 24),
                  DecoratedBox(
                      decoration: BoxDecoration(
                          color: FoxIotTheme.colors.primaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32))),
                      child: Padding(
                          padding: const EdgeInsets.only(
                            left: 32,
                            right: 32,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _AvatarWidget(imageUrl),
                              const SizedBox(height: 24),
                              FoxIoTTextField(
                                controller: nameController,
                                prefixIcon: SvgPicture.asset(
                                    safetyGetAsset(FoxIotAssetName.enterName)
                                        .url),
                                hintText: S.of(context).enter_your_name,
                              ),
                              const SizedBox(height: 16),
                              FoxIoTTextField(
                                controller: bioController,
                                prefixIcon: SvgPicture.asset(
                                    safetyGetAsset(FoxIotAssetName.bio).url),
                                hintText: S.of(context).enter_your_bio,
                              ),
                              const SizedBox(height: 24)
                            ],
                          ))),
                ])))
          ])));
    });
  }
}

class _TopText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("Main Info"),
      SizedBox(height: 24),
      Text(
          "Enter your name, and biography. Dont forget to add your avatar picture!")
    ]);
  }
}

class _AvatarWidget extends StatelessWidget {
  final String? imageUrl;

  const _AvatarWidget(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(32), // Круглые углы
        child: Image.network(
          imageUrl ?? "", // URL изображения
          width: 200,
          height: 240,
          fit: BoxFit.fill,
          errorBuilder: (context, object, stackTrace) {
            return Image.asset(
              safetyGetAsset(FoxIotAssetName.undefined).url,
              width: 200,
              height: 300,
              fit: BoxFit.fill,
            );
          },
        ),
      ),
      Positioned(
        right: 10, // Позиционирование круга в правом нижнем углу
        bottom: 10,
        child: GestureDetector(
          onTap: () {
            print('Круг нажат');
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(Icons.add, color: Colors.white), // Иконка внутри круга
          ),
        ),
      ),
    ]);
  }
}
