import 'package:app/auth/auth_provider.dart';
import 'package:app/layouts/guest_layout.dart';
import 'package:app/layouts/splash_layout.dart';
import 'package:app/layouts/user_layout.dart';
import 'package:app/pages/admins_page.dart';
import 'package:app/pages/announcements_page.dart';
import 'package:app/pages/articles_page.dart';
import 'package:app/pages/banners_page.dart';
import 'package:app/pages/categories/catergories_page.dart';
import 'package:app/pages/dashboard_page.dart';
import 'package:app/pages/dynamic_page.dart';
import 'package:app/pages/emotions_page.dart';
import 'package:app/pages/error_page.dart';
import 'package:app/pages/helpcenter_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/posts_page.dart';
import 'package:app/pages/profile_page.dart';
import 'package:app/pages/reports_page.dart';
import 'package:app/pages/settings_page.dart';
import 'package:app/pages/todo/todo_page.dart';
import 'package:app/router/router.dart';
import 'package:app/widgets/user_provider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Layouts { guest, user }

class RouterHandlers {
  static Handler home = Handler(
    handlerFunc: (context, params) {
      return const HomePage();
    }
  );
  static Handler admins = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.adminsRoute, 
        routeTitle: "Admins",
        page: const AdminsPage(), 
        auth: true,
      );
    }
  );
  static Handler announcements = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.announcementsRoute, 
        routeTitle: "Announcements",
        page: const AnnouncementsPage(), 
        auth: true,
      );
    }
  );
  static Handler articles = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.articlesRoute, 
        routeTitle: "Articles",
        page: const ArticlesPage(), 
        auth: true,
      );
    }
  );
  static Handler banners = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.bannersRoute, 
        routeTitle: "Banners",
        page: const BannersPage(), 
        auth: true,
      );
    }
  );
  static Handler categories = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.categoriesRoute, 
        routeTitle: "Manage Categories",
        page: const CategoriesPage(), 
        auth: true,
      );
    }
  );
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.dashboardRoute, 
        routeTitle: "Dashboard",
        page: const DashboardPage(), 
        auth: true,
      );
    }
  );
  static Handler dynamic = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.dynamicRoute, 
        routeTitle: "Dynamic Page",
        page: const DynamicPage(), 
        auth: true,
      );
    }
  );
  static Handler emotions = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.emotionsRoute, 
        routeTitle: "Manage Emotions",
        page: const EmotionsPage(), 
        auth: true,
      );
    }
  );
  static Handler helpcenter = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.helpcenterRoute, 
        routeTitle: "Help Center",
        page: const HelpcenterPage(), 
        auth: true,
      );
    }
  );
  static Handler posts = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.postsRoute, 
        routeTitle: "Posts List",
        page: const PostsPage(), 
        auth: true,
      );
    }
  );
  static Handler profile = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.profileRoute, 
        routeTitle: "Profile",
        page: const ProfilePage(), 
        auth: true,
      );
    }
  );
  static Handler reports = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.reportsRoute, 
        routeTitle: "Reports",
        page: const ReportsPage(), 
        auth: true,
      );
    }
  );
  static Handler settings = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.settingsRoute, 
        routeTitle: "Settings",
        page: const SettingsPage(), 
        auth: true,
      );
    }
  );
  static Handler todos = Handler(
    handlerFunc: (context, params) {
      return middleware(
        context: context,
        layout: Layouts.user, 
        routeName: Flurorouter.todoRoute, 
        routeTitle: "Todos",
        page: const TodoPage(), 
        auth: true,
      );
    }
  );
  static Handler noPageFound = Handler(
    handlerFunc: ( context, params ) {
      return const ErrorPage();
    }
  );  
}

Widget middleware({
  required context, 
  String routeName = "", 
  String routeTitle = "", 
  required Layouts layout, 
  required Widget page, 
  bool auth = false
}){

  final authProvider = Provider.of<AuthProvider>(context);

  if(auth == true && authProvider.authStatus != AuthStatus.authenticated) {
    return const GuestLayout(child: HomePage());
  }
  
  Provider.of<UserProvider>(context!, listen: false).setCurrentPageUrl(
    routeName: routeName, 
    routeTitle: routeTitle
  );

  if(layout == Layouts.guest){
    return GuestLayout(child: page);
  } 
  if(layout == Layouts.user){
    return UserLayout(child: page);
  } 
  return const SplashLayout();
}