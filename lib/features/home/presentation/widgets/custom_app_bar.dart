import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/constants.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:crm_app/core/utils/widgets/buttons/notifications_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum AppBarType {
  profile, // Profile with location
  titleOnly, // Just title
  titleWithActions, // Title with custom actions
  custom, // Fully customizable
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Common properties
  final AppBarType type;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? elevation;

  // Title properties
  final String? title;
  final TextStyle? titleStyle;
  final bool centerTitle;

  // Profile properties
  final String? userName;
  final String? userImage;
  final String? location;
  final VoidCallback? onProfileTap;
  final VoidCallback? onLocationTap;

  // Notification properties
  final bool showNotifications;
  final int notificationCount;
  final VoidCallback? onNotificationTap;

  // Leading properties
  final Widget? leading;
  final VoidCallback? onLeadingTap;
  final bool automaticallyImplyLeading;

  // Actions properties
  final List<Widget>? actions;

  // Custom content (for maximum flexibility)
  final Widget? customContent;

  const CustomAppBar({
    super.key,
    this.type = AppBarType.profile,
    this.padding,
    this.backgroundColor,
    this.elevation,

    // Title
    this.title,
    this.titleStyle,
    this.centerTitle = false,

    // Profile
    this.userName,
    this.userImage,
    this.location,
    this.onProfileTap,
    this.onLocationTap,

    // Notifications
    this.showNotifications = true,
    this.notificationCount = 0,
    this.onNotificationTap,

    // Leading
    this.leading,
    this.onLeadingTap,
    this.automaticallyImplyLeading = true,

    // Actions
    this.actions,

    // Custom
    this.customContent,
  });

  // Factory constructors for common use cases
  factory CustomAppBar.profile({
    Key? key,
    String? userName,
    String? userImage,
    String? location,
    VoidCallback? onProfileTap,
    VoidCallback? onLocationTap,
    bool showNotifications = true,
    int notificationCount = 0,
    VoidCallback? onNotificationTap,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
  }) {
    return CustomAppBar(
      key: key,
      type: AppBarType.profile,
      userName: userName,
      userImage: userImage,
      location: location,
      onProfileTap: onProfileTap,
      onLocationTap: onLocationTap,
      showNotifications: showNotifications,
      notificationCount: notificationCount,
      onNotificationTap: onNotificationTap,
      padding: padding,
      backgroundColor: backgroundColor,
    );
  }

  factory CustomAppBar.title({
    Key? key,
    required String title,
    TextStyle? titleStyle,
    bool centerTitle = true,
    Widget? leading,
    VoidCallback? onLeadingTap,
    bool automaticallyImplyLeading = true,
    List<Widget>? actions,
    bool showNotifications = false,
    int notificationCount = 0,
    VoidCallback? onNotificationTap,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    double? elevation,
  }) {
    return CustomAppBar(
      key: key,
      type: AppBarType.titleOnly,
      title: title,
      titleStyle: titleStyle,
      centerTitle: centerTitle,
      leading: leading,
      onLeadingTap: onLeadingTap,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      showNotifications: showNotifications,
      notificationCount: notificationCount,
      onNotificationTap: onNotificationTap,
      padding: padding,
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }

  factory CustomAppBar.custom({
    Key? key,
    required Widget customContent,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    double? elevation,
  }) {
    return CustomAppBar(
      key: key,
      type: AppBarType.custom,
      customContent: customContent,
      padding: padding,
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        boxShadow: elevation != null && elevation! > 0
            ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: elevation!, offset: const Offset(0, 2))]
            : null,
      ),
      child: SafeArea(
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (type) {
      case AppBarType.profile:
        return _buildProfileAppBar(context);
      case AppBarType.titleOnly:
      case AppBarType.titleWithActions:
        return _buildTitleAppBar(context);
      case AppBarType.custom:
        return customContent ?? const SizedBox.shrink();
    }
  }

  Widget _buildProfileAppBar(BuildContext context) {
    return Row(
      children: [
        // Profile Image
        if (userName != null || userImage != null) _buildProfileSection(),

        if ((userName != null || userImage != null) && location != null) const SizedBox(width: 12),

        // Location Section
        if (location != null) Expanded(child: _buildLocationSection()),

        // Trailing actions
        ..._buildTrailingActions(),
      ],
    );
  }

  Widget _buildTitleAppBar(BuildContext context) {
    return Row(
      children: [
        // Leading
        if (_shouldShowLeading(context)) _buildLeading(context),

        if (_shouldShowLeading(context)) const SizedBox(width: 12),

        // Title
        if (title != null) Expanded(child: _buildTitle()),

        // Trailing actions
        ..._buildTrailingActions(),
      ],
    );
  }

  Widget _buildProfileSection() {
    return GestureDetector(
      onTap: onProfileTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: CircleAvatar(
          radius: 24,
          backgroundImage: userImage != null && userImage!.isNotEmpty
              ? NetworkImage(userImage!)
              : NetworkImage(Constants.placeholderImage),
          // child: (userImage == null || userImage!.isEmpty)
          //     ? const Icon(Icons.person, size: 24, color: Colors.white)
          //     : null,
        ),
      ),
    );
  }

  Widget _buildLocationSection() {
    return GestureDetector(
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
                  location!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff553B11)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title!,
      style: titleStyle ?? const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
      textAlign: centerTitle ? TextAlign.center : TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }

  bool _shouldShowLeading(BuildContext context) {
    if (leading != null) return true;
    if (!automaticallyImplyLeading) return false;
    return ModalRoute.of(context)?.canPop ?? false;
  }

  Widget _buildLeading(BuildContext context) {
    if (leading != null) {
      return GestureDetector(onTap: onLeadingTap, child: leading!);
    }

    if (automaticallyImplyLeading && (ModalRoute.of(context)?.canPop ?? false)) {
      return GestureDetector(
        onTap: onLeadingTap ?? () => Navigator.of(context).pop(),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.arrow_back_ios_new, size: 20),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  List<Widget> _buildTrailingActions() {
    List<Widget> trailingWidgets = [];

    // Custom actions
    if (actions != null && actions!.isNotEmpty) {
      for (int i = 0; i < actions!.length; i++) {
        if (i > 0) trailingWidgets.add(const SizedBox(width: 8));
        trailingWidgets.add(actions![i]);
      }
    }

    // Add spacing before notifications if there are other actions
    if (trailingWidgets.isNotEmpty && showNotifications) {
      trailingWidgets.add(const SizedBox(width: 12));
    }

    // Notifications
    if (showNotifications) {
      trailingWidgets.add(
        NotificationButton(onNotificationTap: onNotificationTap, notificationCount: notificationCount),
      );
    }

    return trailingWidgets;
  }
}

// Extension for easier usage
extension CustomAppBarExtension on AppBar {
  static CustomAppBar profile({
    Key? key,
    String? userName,
    String? userImage,
    String? location,
    VoidCallback? onProfileTap,
    VoidCallback? onLocationTap,
    bool showNotifications = true,
    int notificationCount = 0,
    VoidCallback? onNotificationTap,
  }) {
    return CustomAppBar.profile(
      key: key,
      userName: userName,
      userImage: userImage,
      location: location,
      onProfileTap: onProfileTap,
      onLocationTap: onLocationTap,
      showNotifications: showNotifications,
      notificationCount: notificationCount,
      onNotificationTap: onNotificationTap,
    );
  }

  static CustomAppBar title({
    Key? key,
    required String title,
    bool centerTitle = true,
    Widget? leading,
    List<Widget>? actions,
    bool showNotifications = false,
  }) {
    return CustomAppBar.title(
      key: key,
      title: title,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
      showNotifications: showNotifications,
    );
  }
}
