// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_auth/app/common/constants/app_colors.dart';
import 'package:simple_auth/app/router/app_router.gr.dart';

@RoutePage()
class NavRouter extends StatefulWidget {
  const NavRouter({
    super.key,
  });

  @override
  State<NavRouter> createState() => _NavRouterState();
}

class _NavRouterState extends State<NavRouter> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        FeedRoute(),
        MapRoute(),
        FavoritesRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabRouter = AutoTabsRouter.of(context);
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            onTap: (index) => tabRouter.setActiveIndex(index),
            currentIndex: tabRouter.activeIndex,
            activeColor: AppColors.primary,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/feed.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/feed.svg',
                  color: AppColors.primary,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/map.svg',
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/map.svg',
                  color: AppColors.primary,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/fav.svg'),
                activeIcon: SvgPicture.asset(
                  'assets/icons/fav.svg',
                  color: AppColors.primary,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  color: kDefaultIconDarkColor,
                ),
                activeIcon: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (context) => child,
            );
          },
        );
      },
    );
  }
}
