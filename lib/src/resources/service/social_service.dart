import 'dart:developer';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum SocialType { facebook, google, twitter, apple }

class LoginSocialResult {
  bool success;
  dynamic id;
  String? secretToken;
  String? accessToken;
  SocialType type;
  String? fullName;
  String? email;
  String? avatar;
  String? code;

  bool get isSuccess => success;

  LoginSocialResult(
      {this.accessToken,
      this.secretToken,
      this.code,
      this.success = false,
      this.email,
      required this.type,
      this.id,
      this.avatar,
      this.fullName});
}

class SocialService {
  SocialService._();

  static SocialService? _instance;

  factory SocialService() {
    if (_instance == null) _instance = SocialService._();
    return _instance!;
  }

  // Username: test_jbijwbw_user@tfbnw.net
  // pass: Werewolf@
  Future<LoginSocialResult> signInFacebook() async {
    LoginSocialResult socialResult =
        LoginSocialResult(type: SocialType.facebook);
    try {
      await FacebookAuth.instance.logOut();
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: [
          'email',
          'public_profile',
          'user_birthday',
          'user_friends',
          'user_gender',
          'user_link'
        ],
      );
      if (result.status != LoginStatus.success) return socialResult;
      final AccessToken? accessToken = result.accessToken;
      final Map<String, dynamic> user = await FacebookAuth.instance.getUserData(
          fields: "name,email,picture.width(200),birthday,friends,gender,link");
      log("User: $user");
      socialResult.id = accessToken?.userId;
      socialResult.accessToken = accessToken?.token;
      socialResult.fullName = user['name'];
      socialResult.email = user['email'];
      socialResult.avatar = user['picture']['data']['url'];
      socialResult.success = true;
    } catch (error) {
      print(error);
    }
    return socialResult;
  }

  Future<LoginSocialResult> signInGoogle() async {
    LoginSocialResult result = LoginSocialResult(type: SocialType.google);
    try {
      if (await GoogleSignIn().isSignedIn()) await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (await GoogleSignIn().isSignedIn()) {
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        result.id = googleUser?.id;
        result.fullName = googleUser?.displayName;
        result.email = googleUser?.email;
        result.avatar = googleUser?.photoUrl;
        result.accessToken = googleAuth?.accessToken;
        result.success = true;
      }
    } catch (error) {
      print(error);
    }
    return result;
  }

  Future<LoginSocialResult> signInTwitter() async {
    LoginSocialResult result = LoginSocialResult(type: SocialType.google);
    try {
      var twitterLogin = new TwitterLogin(
        consumerKey: 'ttTntr6TVb7mrFKAEWoIlLaa5',
        consumerSecret: 'IfIFECaEzS8ofLF5tLEFREDFmGvCUKlxd4uGiKnxvdMjUyoeQr',
      );

      final TwitterLoginResult twitterLoginResult =
          await twitterLogin.authorize();

      switch (twitterLoginResult.status) {
        case TwitterLoginStatus.loggedIn:
          var session = twitterLoginResult.session;
          result.id = twitterLoginResult.session.userId;
          result.fullName = twitterLoginResult.session.username;
          result.accessToken = session.token;
          result.secretToken = session.secret;
          result.success = true;
          break;
        case TwitterLoginStatus.cancelledByUser:
          break;
        case TwitterLoginStatus.error:
          print("SignIn Twitter Error: ${twitterLoginResult.errorMessage}");
          break;
      }
    } catch (error) {
      print("SignIn Twitter Error: $error");
    }
    return result;
  }

  static Future<LoginSocialResult> signInWithApple() async {
    LoginSocialResult result = LoginSocialResult(type: SocialType.apple);
    final credential = await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);

    print(credential);
    result.email = credential.email;
    result.code = credential.authorizationCode;
    result.fullName = '${credential.givenName} ${credential.familyName}';
    return result;
  }
}
