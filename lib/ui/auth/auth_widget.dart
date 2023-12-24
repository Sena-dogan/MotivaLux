import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../config/router/app_router.dart';
import '../../utils/context_extensions.dart';
import 'login_logic.dart';

class AuthSocialWidget extends ConsumerStatefulWidget {
  const AuthSocialWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthSocialWidgetState();
}

class _AuthSocialWidgetState extends ConsumerState<AuthSocialWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: context.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SocialLoginButton(
                  buttonType: SocialLoginButtonType.google,
                  onPressed: () async {
                    await ref
                        .read(loginLogicProvider.notifier)
                        .signInWithGoogle()
                        .then((bool value) => value
                            ? context.go(SGRoute.home.route)
                            : context.showErrorSnackBar(
                                title: 'Hata',
                                message:
                                    'Bir hata oluştu. Lütfen tekrar deneyiniz.'));
                  },
                  borderRadius: 30),
            ),
            Visibility(
              visible: Platform.isIOS,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SocialLoginButton(
                    buttonType: SocialLoginButtonType.appleBlack,
                    onPressed: () {
                      ref
                          .read(loginLogicProvider.notifier)
                          .signInWithApple()
                          .then((bool value) => value
                              ? context.go(SGRoute.home.route)
                              : context.showErrorSnackBar(
                                  title: 'Hata',
                                  message:
                                      'Bir hata oluştu. Lütfen tekrar deneyiniz.'));
                    },
                    borderRadius: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
