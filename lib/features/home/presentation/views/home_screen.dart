import 'package:crm_app/core/widgets/custom_scaffold.dart';
import 'package:crm_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

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
