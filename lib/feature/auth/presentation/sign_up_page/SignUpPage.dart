import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpContracts.dart';
import 'package:fox_iot/feature/home/home_page.dart';
import 'package:fox_iot/feature/welcome_page/pres/welcome_page.dart';
import 'package:fox_iot/utils/AssetsManipulations.dart';

import '../../../../res/components/background.dart';
import '../../../../res/values/assets.dart';
import '../../../../res/values/s.dart';
import '../../../../res/values/theme.dart';
import 'SignUpBloc.dart';

class SignUpPage extends StatefulWidget {
  static const String navId = "sign_up_page";

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      final loading = state.loadingState;
      final isPasswordVisible = state.isPasswordVisible;
      final bloc = BlocProvider.of<SignUpBloc>(context);
      return Background(Scaffold(
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
                    top: 24, right: 32, left: 32, bottom: 32),
                child: Center(
                    child: Column(children: [
                  const SizedBox(
                    height: 32,
                  ),
                  _NavigationAnimateRow(
                      () => Navigator.pushNamed(context, WelcomePage.navId),
                      () => {
                            //todo Перейти на MainInfoPage
                          }),
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
                              const SizedBox(
                                height: 24,
                              ),
                              TextField(
                                controller: emailController,
                                style: FoxIotTheme.textStyles.primary,
                                decoration: InputDecoration(
                                  fillColor: FoxIotTheme.colors.secondary,
                                  prefixIcon: Image.asset(FoxIotTheme
                                      .assets[FoxIotAssetName.email]!.url),
                                  hintText: S.of(context).e_mail,
                                  filled: true,
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextField(
                                controller: passwordController,
                                textAlignVertical: TextAlignVertical.center,
                                style: FoxIotTheme.textStyles.primary,
                                decoration: InputDecoration(
                                    fillColor: FoxIotTheme.colors.secondary,
                                    prefixIcon: Image.asset(FoxIotTheme
                                        .assets[FoxIotAssetName.passwordLock]!
                                        .url),
                                    suffixIcon: IconButton(
                                      alignment: Alignment.center,
                                      icon: Image.asset(FoxIotTheme
                                          .assets[FoxIotAssetName.visible]!
                                          .url),
                                      onPressed: () {},
                                    ),
                                    hintText: S.of(context).password,
                                    filled: true),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              TextField(
                                controller: passwordCheckController,
                                textAlignVertical: TextAlignVertical.center,
                                style: FoxIotTheme.textStyles.primary,
                                decoration: InputDecoration(
                                    fillColor: FoxIotTheme.colors.secondary,
                                    prefixIcon: Image.asset(FoxIotTheme
                                        .assets[FoxIotAssetName.passwordLock]!
                                        .url),
                                    suffixIcon: IconButton(
                                      alignment: Alignment.center,
                                      icon: Image.asset(FoxIotTheme
                                          .assets[FoxIotAssetName.visible]!
                                          .url),
                                      onPressed: () {},
                                    ),
                                    hintText: S.of(context).password,
                                    filled: true),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                            ],
                          ))),
                ])))
          ])));
    });
  }
}

class _NavigationAnimateRow extends StatefulWidget {
  final Function() backNavigate;
  final Function() nextNavigate;

  const _NavigationAnimateRow(this.backNavigate, this.nextNavigate);

  @override
  State<StatefulWidget> createState() =>
      _NavigationAnimateRowState(backNavigate, nextNavigate);
}

class _NavigationAnimateRowState extends State<_NavigationAnimateRow>
    with SingleTickerProviderStateMixin {
  bool _isRightDirection = false;
  final Function() backNavigate;
  final Function() nextNavigate;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  _NavigationAnimateRowState(this.backNavigate, this.nextNavigate);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )
      ..repeat(reverse: true)
      ..addStatusListener((status) {
        setState(() {
          _isRightDirection = !(status == AnimationStatus.forward);
        });
      });

    _animation = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: const Offset(7.5, 0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                _CircularArrowButton(backNavigate, true),
                SlideTransition(
                  position: _animation,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scale(_isRightDirection ? -1.0 : 1.0, 1.0, 1.0),
                    child: Image.asset(
                        safetyGetAsset(FoxIotAssetName.signUpFoxGif).url,
                        height: 125.0),
                  ),
                ),
              ],
            ),
            _CircularArrowButton(nextNavigate, false),
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _CircularArrowButton extends StatelessWidget {
  final Function() onClick;
  final bool isBackDirection;

  const _CircularArrowButton(this.onClick, this.isBackDirection);

  @override
  Widget build(BuildContext context) {
    Icon? icon;
    if (isBackDirection) {
      icon = const Icon(Icons.arrow_back);
    } else {
      icon = const Icon(Icons.arrow_forward);
    }
    return GestureDetector(
        onTap: onClick,
        child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: FoxIotTheme.colors.primary,
                shape: BoxShape.circle,
                border: Border.all()),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: icon,
            )));
  }
}
