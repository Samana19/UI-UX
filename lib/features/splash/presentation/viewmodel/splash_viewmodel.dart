// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:the_daily_digest/config/router/approutes.dart';
import 'package:the_daily_digest/core/shared-prefs/user_shared_preferences.dart';

final splashViewModelProvider = StateNotifierProvider<SplashViewModel, void>(
  (ref) {
    return SplashViewModel(
      ref.read(userSharedPrefsProvider),
    );
  },
);

class SplashViewModel extends StateNotifier<void> {
  final UserSharedPrefs _userSharedPrefs;
  SplashViewModel(this._userSharedPrefs) : super(null);

  init(BuildContext context) async {
    final data = await _userSharedPrefs.getUserToken();

    data.fold((l) => null, (token) {
      // ignore: unnecessary_null_comparison
      if (token != null) {
        bool isTokenExpired = isValidToken(token);
        if (isTokenExpired) {
          // We will not do navigation like this,
          // we will use mixin and navigator class for this
          Navigator.popAndPushNamed(context, AppRoute.loginRoute);

          // } else {
          //   Navigator.popAndPushNamed(context, AppRoute.bottomnavRoute);
        }
      } else {
        Navigator.popAndPushNamed(context, AppRoute.loginRoute);
      }
    });
  }

  bool isValidToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    // 10 digit
    int expirationTimestamp = decodedToken['exp'];
    // 13
    final currentDate = DateTime.now().millisecondsSinceEpoch;
    // If current date is greater than expiration timestamp then token is expired
    return currentDate > expirationTimestamp * 1000;
  }
}
