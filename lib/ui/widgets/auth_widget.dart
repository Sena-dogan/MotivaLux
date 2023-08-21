import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../auth/login_logic.dart';


class AuthSocialWidget extends ConsumerStatefulWidget {
  const AuthSocialWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthSocialWidgetState();
}

class _AuthSocialWidgetState extends ConsumerState<AuthSocialWidget> {
  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS
        ? const SignInWithApple()
        : const SignInWithGoogle());
  }
}

class SignInWithApple extends ConsumerWidget {
  const SignInWithApple({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SocialLoginButton(
        buttonType: SocialLoginButtonType.appleBlack,
        backgroundColor: Colors.black,
        borderRadius: 50,
        onPressed: () {
          ref.read(loginLogicProvider.notifier).signInWithApple();
        });
  }
}

class SignInWithGoogle extends ConsumerWidget {
  const SignInWithGoogle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SocialLoginButton(
        buttonType: SocialLoginButtonType.google,
        backgroundColor: Colors.white,
        borderRadius: 50,
        onPressed: () {
          ref.read(loginLogicProvider.notifier).signInWithGoogle();
        });
  }
}
