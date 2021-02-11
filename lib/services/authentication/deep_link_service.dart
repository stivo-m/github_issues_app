import 'dart:async';
import 'package:uni_links/uni_links.dart';

import 'auth_service.dart';

class DeepLinkService {
  static StreamSubscription _subs;

  static void initDeepLinkListener() async {
    _subs = getLinksStream().listen((String link) {
      checkDeepLink(link);
    }, cancelOnError: true);
  }

  static Future checkDeepLink(String link) async {
    var user;
    if (link != null) {
      String code = link.substring(link.indexOf(RegExp('code=')) + 5);
      await authService.loginWithGitHub(code).then((firebaseUser) {
        user = firebaseUser;
      }).catchError((e) {});
    }

    return user;
  }

  static void disposeDeepLinkListener() {
    if (_subs != null) {
      _subs.cancel();
      _subs = null;
    }
  }
}
