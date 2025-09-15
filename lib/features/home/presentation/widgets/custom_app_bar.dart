import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/constants.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/buttons/notifications_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String userName;
  final String userImage;
  final String location;
  final int notificationCount;
  final VoidCallback? onLocationTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const CustomAppBar({
    super.key,
    this.userName = "User",
    this.userImage = "assets/images/user_avatar.png", // Replace with your asset
    this.location = "23/B Kumapara, Sylhet",
    this.notificationCount = 6,
    this.onLocationTap,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          // Profile Image
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(Constants.placeholderImage),
                // Fallback if image fails to load
                child: userImage.isEmpty ? const Icon(Icons.person, size: 24, color: Colors.white) : null,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Location Section
          Expanded(
            child: GestureDetector(
              onTap: onLocationTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.my_location.tr(),
                        style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.grey[600]),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      AppIcons.locationPinIc.icon(),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff553B11)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Notification Bell
          NotificationButton(onNotificationTap: onNotificationTap, notificationCount: notificationCount),
        ],
      ),
    );
  }
}
