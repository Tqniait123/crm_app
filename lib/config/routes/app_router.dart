// Import necessary packages and files
import 'package:project_name/core/extensions/num_extension.dart';
import 'package:project_name/core/extensions/widget_extensions.dart';
import 'package:project_name/core/utils/widgets/buttons/custom_back_button.dart';
import 'package:project_name/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

// Define the AppRouter class
class AppRouter {
  // Create a GoRouter instance
  final GoRouter router = GoRouter(

    initialLocation: Routes.initialRoute,
    navigatorKey: rootNavigatorKey,
    errorPageBuilder: (context, state) {
      return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 200),
        key: state.pageKey,
        child: _unFoundRoute(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
    },
    observers: [
      routeObserver,
      GoRouterObserver(), // Specify your observer here
    ],
    routes: [
      // Define routes using GoRoute
      GoRoute(
        redirect: (context, state) {

        },

        path: Routes.initialRoute,
        builder: (context, state) {
          // Return the SplashScreen widget
          return const SplashScreen();
        },
      ),

      GoRoute(
        path: Routes.onBoarding1,
        builder: (context, state) {
          // Return the SplashScreen widget
          return const OnBoardingScreen();
        },
      ),

    ],
  );

  // Define a static method for the "Un Found Route" page
  static Widget _unFoundRoute(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBackButton(),
            100.gap,
            Center(child: Text("Un Found Route", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))),
          ],
        ),
      ).paddingHorizontal(24),
    );
  }

  @override
  List<Object?> get props => [router];
}
