import 'package:app/auth/auth_model.dart';
import 'package:app/config/cafe_api.dart';
import 'package:app/config/local_storage.dart';
import 'package:app/config/navigation_service.dart';
import 'package:app/config/notifications_service.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';

enum AuthStatus { authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.notAuthenticated;
  bool authLoading = true;
  String authNames = "";
  String authAvatar = "";
  String authRol = "";

  AuthProvider() {
    isAuthenticated();
  }

  login({
      required String email,
      required String password
  }) async {
    try {
      const url = "/v1/manager/login";
      final data = {'email': email, 'password': password};
      final resp = await CafeApi.post(url, data);
      final authResponse = AuthResponse.fromMap(resp);
      authRol = authResponse.rol;
      authNames = authResponse.names;     
      authAvatar = authResponse.avatar;     
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);       
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    } catch (e) {
      NotificationsService.showSnackbarError('Email / Password wrong');
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    NavigationService.replaceTo(Flurorouter.rootRoute);
    CafeApi.configureDio();
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      Future.delayed(const Duration(seconds: 5), () {
        authStatus = AuthStatus.notAuthenticated;
        authLoading = false;
        notifyListeners();
      });
      return false;
    }

    try {
      const url = "/v1/manager/auth";
      final resp = await CafeApi.httpGet(url);
      final authResponse = AuthResponse.fromMap(resp);
      authRol = authResponse.rol;
      authNames = authResponse.names;     
      authAvatar = authResponse.avatar;
      authStatus = AuthStatus.authenticated;
      authLoading = false;
      LocalStorage.prefs.setString('token', authResponse.token);
      notifyListeners();
      return true;
    } catch (e) {
      Future.delayed(const Duration(seconds: 5), () {
        LocalStorage.prefs.remove('token');
        authStatus = AuthStatus.notAuthenticated;
        authLoading = false;
        notifyListeners();
      });
      return false;
    }
  }
}
