import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/constants.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/widgets/custom_scaffold.dart';
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
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(Constants.placeholderImage),
              // Fallback if image fails to load
              child: userImage.isEmpty ? const Icon(Icons.person, size: 24, color: Colors.white) : null,
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
                        'My Location',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.grey[600]),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.brown[600]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.brown[700]),
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

// Usage in your HomeScreen:
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            CustomAppBar(
              notificationCount: 6,
              onLocationTap: () {
                // Handle location tap
                print("Location tapped");
              },
              onNotificationTap: () {
                // Handle notification tap
                print("Notification tapped");
              },
              onProfileTap: () {
                // Handle profile tap
                print("Profile tapped");
              },
            ),

            // Rest of your content
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Home Content Here")]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
