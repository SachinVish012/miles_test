import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_media/common_widgets/youtube_video_player.dart';
import 'package:test_media/core/routes/routes_name.dart';
import 'package:test_media/modules/bottom_naviagtion/bottom_navigation.dart';
import 'package:test_media/modules/home/home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final GoRouter _router = GoRouter(
    initialLocation: RoutesName.bottomNavigation,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: RoutesName.homePage,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
       GoRoute(
        path: RoutesName.bottomNavigation,
        builder: (context, state) {
          return const BottomNavigation();
        },
      ),
        GoRoute(
        path: RoutesName.youtubePlayer,
        builder: (context, state) {
          return  YoutubeVideoPlayer(
           prams: state.extra==null?null:state.extra as YoutubeVideoPlayerPrams,
          );
        },
      ),
    ],
  );

  static GoRouter get appRouter => _router;
}
