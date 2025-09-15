import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/icons.dart';
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
    return GestureDetector(
      onTap: onNotificationTap,
      child: Stack(
        children: [
          // Main container with gradient border at bottom
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xFFFF6B6B).withOpacity(0.3), // Light red gradient
                  Color(0xFFFF3838).withOpacity(0.5), // Matching the badge color
                ],
                stops: [0.0, 0.6, 0.8, 1.0],
              ),
            ),
            child: Badge(
              label: Text(
                notificationCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              largeSize: 20,
              smallSize: 20,
              backgroundColor: Color(0xffFF3838),
              child: Container(
                margin: EdgeInsets.all(2), // Small margin to show gradient border
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2)),
                  ],
                ),
                child: AppIcons.notificationsIc.icon(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
