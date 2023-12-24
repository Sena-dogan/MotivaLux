import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
    state = state.copyWith(isLoading: isLoading, isLoggedIn: true);
  }

  void clear() {
    state = state.copyWith(error: null, isLoading: false);
  }

  Future<bool> signInWithGoogle() async {
    try {
      setLogin(isLoading: true);
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
              clientId: Platform.isIOS
                  ? '247383540944-p3ji8erp1cscvs4hov7prbahfbqtpbrp.apps.googleusercontent.com'
                  : null)
          .signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((UserCredential value) {
        final User firebaseUser = value.user!;
        firebaseUser.updateDisplayName(googleUser?.displayName);
        firebaseUser.updatePhotoURL(googleUser?.photoUrl);
      });
      return true;
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      setError(e.toString());
      setLogin();
      return false;
    }
  }

  Future<bool> signInWithApple() async {
    debugPrint(
        'hello my name is apple. i am 7 years old. i like to eat apples');
    try {
      debugPrint(
          'AAAAAAAAAA my name is apple. i am 7 years old. i like to eat apples');
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
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((UserCredential userCredential) {
        final User firebaseUser = userCredential.user!;
        if (appleCredential.givenName != null &&
            appleCredential.familyName != null) {
          firebaseUser.updateDisplayName(
              '${appleCredential.givenName} ${appleCredential.familyName}');
        }
      });
      return true;
    } catch (e) {
      debugPrint(e.toString());
      setError(e.toString());
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Check google sign in
      final GoogleSignIn googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.disconnect();
        await googleSignIn.signOut();
      }
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      setError(e.toString());
      return false;
    }
  }

  Future<bool> removeUser() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
      if (await GoogleSignIn().isSignedIn()) {
        await GoogleSignIn().disconnect();
        await GoogleSignIn().signOut();
      }
      return true;
    } catch (e) {
      debugPrint('Error: $e');
      setError(e.toString());
      return false;
    }
  }

  void setError(String error) {
    state = state.copyWith(error: error);
  }

  void setLoggedIn(bool isLoggedIn) {
    state = state.copyWith(isLoggedIn: isLoggedIn);
  }
}
