import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/',
          page: NavRouter.page,
          children: [
            AutoRoute(path: 'feed', page: FeedRoute.page),
            AutoRoute(path: 'map', page: MapRoute.page),
            AutoRoute(path: 'favorites', page: FavoritesRoute.page),
            AutoRoute(
              path: 'profile',
              page: ProfileRoute.page,
              initial: true,
            ),
          ],
        ),
      ];
}
