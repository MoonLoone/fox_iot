import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_iot/feature/auth/presentation/sign_up_page/SignUpContracts.dart';

import '../../../../../res/components/background.dart';
import '../../../../../res/values/assets.dart';
import '../../../../../res/values/s.dart';
import '../../../../../res/values/theme.dart';
import '../SignUpBloc.dart';

class SignUpPage extends StatefulWidget {
  static const String navId = "sign_up_page";

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
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
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(S.of(context).signIn,
                        style: FoxIotTheme.textStyles.h3),
                    Text(
                      "Nero forte...",
                      style: FoxIotTheme.textStyles.primary,
                    ),
                  ],
                )),
            Center(
                child: FractionallySizedBox(
              widthFactor: 0.7,
              heightFactor: 0.6,
              child: DecoratedBox(
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
                          Text(
                            S.of(context).main_info,
                            style: FoxIotTheme.textStyles.primary,
                          ),
                          TextField(
                            controller: state.nicknameController,
                            style: FoxIotTheme.textStyles.primary,
                            decoration: InputDecoration(
                              fillColor: FoxIotTheme.colors.secondary,
                              prefixIcon: Image.asset(FoxIotTheme
                                  .assets[FoxIotAssetName.person]!.url),
                              hintText: S.of(context).nickname,
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: state.emailController,
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
                            controller: state.passwordController,
                            textAlignVertical: TextAlignVertical.center,
                            style: FoxIotTheme.textStyles.primary,
                            decoration: InputDecoration(
                                fillColor: FoxIotTheme.colors.secondary,
                                prefixIcon: Image.asset(FoxIotTheme
                                    .assets[FoxIotAssetName.passwordLock]!.url),
                                suffixIcon: IconButton(
                                  alignment: Alignment.center,
                                  icon: Image.asset(FoxIotTheme
                                      .assets[FoxIotAssetName.visible]!.url),
                                  onPressed: () {},
                                ),
                                hintText: S.of(context).password,
                                filled: true),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: state.rPasswordController,
                            textAlignVertical: TextAlignVertical.center,
                            style: FoxIotTheme.textStyles.primary,
                            decoration: InputDecoration(
                                fillColor: FoxIotTheme.colors.secondary,
                                prefixIcon: Image.asset(FoxIotTheme
                                    .assets[FoxIotAssetName.passwordLock]!.url),
                                suffixIcon: IconButton(
                                  alignment: Alignment.center,
                                  icon: Image.asset(FoxIotTheme
                                      .assets[FoxIotAssetName.visible]!.url),
                                  onPressed: () {},
                                ),
                                hintText: S.of(context).password,
                                filled: true),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextButton(
                            onPressed: () {
                              bloc.add(NextButtonClick());
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    FoxIotTheme.colors.third),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(20)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)))),
                            child: Text(
                              S.of(context).next,
                              style: FoxIotTheme.textStyles.primary
                                  .copyWith(color: FoxIotTheme.colors.onThird),
                            ),
                          ),
                        ],
                      ))),
            ))
          ])));
    });
  }
}
