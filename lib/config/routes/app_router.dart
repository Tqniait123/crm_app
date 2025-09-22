// Import necessary packages and files
import 'package:crm_app/config/routes/routes.dart';
import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/widget_extensions.dart';
import 'package:crm_app/core/observers/router_observer.dart';
import 'package:crm_app/core/services/di.dart';
import 'package:crm_app/core/utils/widgets/buttons/custom_back_button.dart';
import 'package:crm_app/features/auth/presentation/controller/auth_cubit.dart';
import 'package:crm_app/features/auth/presentation/views/login_screen.dart';
import 'package:crm_app/features/home/presentation/views/home_screen.dart';
import 'package:crm_app/features/layout/presentation/pages/layout.dart';
import 'package:crm_app/features/on_boarding/presentation/pages/on_boarding_screen.dart';
import 'package:crm_app/features/splash/presentation/pages/second_splash.dart';
import 'package:crm_app/features/splash/presentation/pages/splash.dart';
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
          return null;
        },

        path: Routes.initialRoute,
        builder: (context, state) {
          // Return the SplashScreen widget
          return const SplashScreen();
        },
      ),

      GoRoute(
        path: Routes.secondSplash,
        builder: (context, state) {
          // Return the SplashScreen widget
          return const SecondSplashScreen();
        },
      ),

      GoRoute(
        path: Routes.onBoarding1,
        builder: (context, state) {
          // Return the SplashScreen widget
          return const OnBoardingScreen();
        },
      ),
      GoRoute(
        path: Routes.layout,
        builder: (context, state) {
          // Return the Layout widget
          return const LayoutScreen();
        },
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) {
          // Return the LoginScreen widget
          return BlocProvider(create: (context) => AuthCubit(sl()), child: const LoginScreen());
        },
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) {
          // Return the HomeScreen widget
          return const HomeScreen();
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
            Center(
              child: Text("Un Found Route", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ).paddingHorizontal(24),
    );
  }

  @override
  List<Object?> get props => [router];
}
