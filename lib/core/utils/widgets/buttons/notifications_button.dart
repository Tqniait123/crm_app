import 'package:crm_app/core/extensions/text_style_extension.dart';
import 'package:crm_app/core/extensions/theme_extension.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/utils/widgets/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';

// class NotificationsButton extends StatelessWidget {
//   final Color? color;
//   final Color? iconColor;
//   const NotificationsButton({super.key, this.color, this.iconColor});

//   @override
//   Widget build(BuildContext context) {
//     return CustomIconButton(
//       // width: 51.r,
//       // height: 51.r,
//       iconAsset: AppIcons.notificationsIc,
//       iconColor: iconColor,
//       color: color ?? Color(0xff6468AC),
//       onPressed: () {
//         context.checkVerifiedAndGuestOrDo(() => context.push(Routes.notifications));
//         // context.push(Routes.notifications);
//       },
//     );
//   }
// }

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key, required this.onNotificationTap, required this.notificationCount});

  final VoidCallback? onNotificationTap;
  final int notificationCount;

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text('$notificationCount', style: context.titleMedium.bold.s14.copyWith(color: AppColors.white)),
      backgroundColor: AppColors.primary,

      child: CustomIconButton(
        color: AppColors.white,
        iconAsset: AppIcons.notificationsIc,
        onPressed: () {},
        hasOvalBackground: true,
        buttonType: ButtonType.fullyRounded,
      ),
    );
  }
}
