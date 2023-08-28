import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../models/auth/login_ui_model.dart';

part 'login_logic.g.dart';

@riverpod
class LoginLogic extends _$LoginLogic {
  @override
  LoginUiModel build() {
    return const LoginUiModel();
  }

  void setLogin({bool isLoading = false}) {
    state = state.copyWith(isLoading: isLoading);
  }

  void clear() {
    state = state.copyWith(error: null, isLoading: false);
  }

  Future<void> signInWithGoogle() async {
    try {
      setLogin(isLoading: true);
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      setLogin();
    } catch (e) {
      debugPrint(e.toString());
      setError(e.toString());
      setLogin();
    }
  }

  Future<void> signInWithApple() async {
    debugPrint('hello my name is apple. i am 7 years old. i like to eat apples');
    try {
    debugPrint('AAAAAAAAAA my name is apple. i am 7 years old. i like to eat apples');
      setLogin(isLoading: true);
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: <AppleIDAuthorizationScopes>[
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
      final AuthCredential credential = oAuthProvider.credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      setLogin();
    } catch (e) {
      debugPrint(e.toString());
      setError(e.toString());
      setLogin();
    }
  }

  void setError(String error) {
    state = state.copyWith(error: error);
  }

  void setLoggedIn(bool isLoggedIn) {
    state = state.copyWith(isLoggedIn: isLoggedIn);
  }
}
