import 'package:crm_app/config/routes/app_router.dart';
import 'package:crm_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends Scaffold {
  CustomScaffold({
    super.key,
    super.appBar,
    Widget? body,
    bool showBackgroundIcon = false,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.drawer,
    super.endDrawer,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary,
    super.extendBody,
    super.extendBodyBehindAppBar = true,
  }) : super(body: _buildBody(body, showBackgroundIcon, appBar != null));

  static Widget? _buildBody(Widget? body, bool showBackgroundIcon, bool show) {
    final context = rootNavigatorKey.currentContext!;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // if (show)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: kToolbarHeight + context.statusBarHeight + 200,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFBC5C5), // pinkish
                  Color(0xFFFFFFFF), // white
                ],
              ),
            ),
          ),
        ),
        if (body != null) body,
      ],
    );
  }
}
