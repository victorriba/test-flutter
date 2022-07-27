import 'package:app/router/router_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String adminsRoute = '/admins';
  static String announcementsRoute = '/announcements';
  static String articlesRoute = '/articles';
  static String bannersRoute = '/banners';
  static String categoriesRoute = '/categories';
  static String dashboardRoute = '/dashboard';
  static String dynamicRoute = '/dynamic';
  static String emotionsRoute = '/emotions';
  static String helpcenterRoute = '/helpcenter';
  static String postsRoute = '/posts';
  static String profileRoute = '/profile';
  static String reportsRoute = '/reports';
  static String settingsRoute = '/settings';
  static String todoRoute = '/todos';

  static void configureRoutes() {

    router.define( 
      rootRoute, 
      handler: RouterHandlers.home, 
      transitionType: TransitionType.materialFullScreenDialog
    );

    router.define( 
      adminsRoute, 
      handler: RouterHandlers.admins, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      announcementsRoute, 
      handler: RouterHandlers.announcements, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      articlesRoute, 
      handler: RouterHandlers.articles, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      bannersRoute, 
      handler: RouterHandlers.banners, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      categoriesRoute, 
      handler: RouterHandlers.categories, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      dashboardRoute, 
      handler: RouterHandlers.dashboard, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      dynamicRoute, 
      handler: RouterHandlers.dynamic, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      emotionsRoute, 
      handler: RouterHandlers.emotions, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      helpcenterRoute, 
      handler: RouterHandlers.helpcenter, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      postsRoute, 
      handler: RouterHandlers.posts, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      profileRoute, 
      handler: RouterHandlers.profile, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      reportsRoute, 
      handler: RouterHandlers.reports, 
      transitionType: TransitionType.materialFullScreenDialog 
    );
    router.define( 
      settingsRoute, 
      handler: RouterHandlers.settings, 
      transitionType: TransitionType.materialFullScreenDialog 
    );

    router.define( 
      todoRoute, 
      handler: RouterHandlers.todos, 
      transitionType: TransitionType.materialFullScreenDialog 
    );

    router.notFoundHandler = RouterHandlers.noPageFound;
  }
}