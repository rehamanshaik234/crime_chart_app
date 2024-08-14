import 'package:crime_chart_app/utils/routes/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../views/chart/chart_screen.dart';
import '../../views/home_screen/home_screen.dart';

class Routes{

  static GoRouter getAppRoutes(BuildContext context){
    final GoRouter _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: RouteNames.chartScreen,
              builder: (BuildContext context, GoRouterState state) {
                return ChartScreen();
              },
            ),
          ],
        ),
      ],
    );
    return _router;
  }
}