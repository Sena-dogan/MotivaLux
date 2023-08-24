import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../data/getstore/get_store_helper.dart';
import '../../di/components/service_locator.dart';
import '../../models/auth/login_ui_model.dart';

part 'login_logic.g.dart';

@riverpod
class LoginLogic extends _$LoginLogic {
  final GetStoreHelper _getStoreHelper = getIt<GetStoreHelper>();
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
      await _getStoreHelper.signInWithCredential(credential);
      setLogin();
    } catch (e) {
      setError(e.toString());
      setLogin();
    }
  }

  Future<void> signInWithApple() async {
    try {
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
      await _getStoreHelper.signInWithCredential(credential);
      setLogin();
    } catch (e) {
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
