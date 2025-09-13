import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors - Modern and Professional
  static const Color primary = Color(0xFF6366F1);           // Modern indigo
  static const Color primaryDark = Color(0xFF4F46E5);       // Darker indigo
  static const Color primaryLight = Color(0xFF8B5CF6);      // Light purple
  static const Color secondary = Color(0xFF06B6D4);         // Cyan
  static const Color accent = Color(0xFF8B5CF6);            // Purple

  // Semantic Colors
  static const Color success = Color(0xFF10B981);           // Green
  static const Color warning = Color(0xFFF59E0B);           // Amber
  static const Color error = Color(0xFFEF4444);             // Red
  static const Color info = Color(0xFF3B82F6);              // Blue

  // Neutral Colors - Complete Gray Scale
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);

  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // Legacy colors for backward compatibility
  static const Color transparent = Colors.transparent;
  static const Color gradient = Color(0xFFbca1ff);
  static const Color backgroundColor = Color(0xFF3E3989);
  static const Color primaryGradientStart = Color(0xFF7D00FF);
  static const Color primaryGradientEnd = Color(0xFF3E3989);
  static const Color disableColor = Color(0xFFA5A5A5);
  static const Color pattern = Color(0xFF0D0D1B);
  static const Color lightPrimary = Color(0xFFBFEBC0);
  static const Color unselectedIndicator = Color(0xFFCCC5B9);
  static const Color whiteFD = Color(0xFFFDFDFD);
  static const Color whiteFFF = Color(0xFFF1ECEC);
  static const Color whiteF3 = Color(0xFFF3F3F3);
  static const Color whiteEA = Color(0xFFEAEAF3);
  
  // Border Colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderFocus = Color(0xFF6366F1);
  static const Color borderColor = Color(0xFFEAEAEA);
  
  // Status Colors
  static const Color online = Color(0xFF10B981);
  static const Color offline = Color(0xFF6B7280);
  static const Color pending = Color(0xFFF59E0B);
  
  // Legacy grays - mapped to new system
  static const Color grey = grey500;
  static const Color grey4A = grey600;
  static const Color greyED = grey200;
  static const Color grey60 = grey500;
  static const Color greyF5 = grey100;
  static const Color grey8E = grey400;
  static const Color greyC4 = grey300;
  static const Color grey81 = grey500;
  static const Color greyAF = grey400;
  static const Color greyE4 = grey200;
  static const Color grey78 = grey500;
  static const Color grey8A = grey500;
  static const Color green95 = Color(0xFF95D7A4);
  static const Color green1E = Color(0xFF1E4545);
  static const Color black25 = Color(0xFF252525);
  static const Color black26 = Color(0xFF262626);
  static const Color black17 = Color(0xFF171716);
  static const Color darkBlue = Color(0xff1C274C);
  static const Color blue23 = Color(0xFF236CF6);
  static const Color blue3D = Color(0xFF3D5A80);
  static const Color blue20 = Color(0xFF203864);
  static const Color blueE2 = Color(0xFFe2ebf6);
  static const Color redED = Color(0xFFED1C24);
  static const Color redD7 = Color(0xFFD72822);
  static const Color redD2 = Color(0xFFD21312);
  static const Color red7D = Color(0xFF7D0A0A);

  // Gradient definitions
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryGradientStart, primaryGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF34D399), Color(0xFF10B981)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warningGradient = LinearGradient(
    colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient errorGradient = LinearGradient(
    colors: [Color(0xFFF87171), Color(0xFFEF4444)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadow definitions
  static List<BoxShadow> get defaultShadow => [
    BoxShadow(
      color: black.withOpacity(0.05),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> get mediumShadow => [
    BoxShadow(
      color: black.withOpacity(0.1),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get largeShadow => [
    BoxShadow(
      color: black.withOpacity(0.15),
      blurRadius: 20,
      offset: const Offset(0, 8),
    ),
  ];

  // Helper methods
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
      case 'success':
        return success;
      case 'pending':
      case 'warning':
        return warning;
      case 'inactive':
      case 'error':
      case 'failed':
        return error;
      case 'info':
        return info;
      default:
        return grey500;
    }
  }

  static Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
      case 'urgent':
        return error;
      case 'medium':
        return warning;
      case 'low':
        return success;
      default:
        return grey500;
    }
  }
}
