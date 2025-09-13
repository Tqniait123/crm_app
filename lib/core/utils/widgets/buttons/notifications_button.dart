import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_name/config/routes/routes.dart';
import 'package:project_name/core/extensions/is_logged_in.dart';
import 'package:project_name/core/static/icons.dart';
import 'package:project_name/core/utils/widgets/buttons/custom_icon_button.dart';

class NotificationsButton extends StatelessWidget {
  final Color? color;
  final Color? iconColor;
  const NotificationsButton({super.key, this.color, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      // width: 51.r,
      // height: 51.r,
      iconAsset: AppIcons.notificationsIc,
      iconColor: iconColor,
      color: color ?? Color(0xff6468AC),
      onPressed: () {
        context.checkVerifiedAndGuestOrDo(() => context.push(Routes.notifications));
        // context.push(Routes.notifications);
      },
    );
  }
}
