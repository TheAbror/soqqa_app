import 'package:flutter/material.dart';
import 'package:soqqa_app/core/routes/cupertino_style_navigation_route.dart';
import 'package:soqqa_app/core/routes/route_constants.dart';
import 'package:soqqa_app/ui/pages/root_page.dart';

class MainRouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.rootPage:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const RootPage(),
        );

      default:
        return CustomCupertinoStyleNavigationRoute(
          builder: (_) => const RootPage(),
          // builder: (_) =>
          //     DiscussionPage(viewModel: IDandTitle(id: 0, title: '')),
        );
    }
  }
}
