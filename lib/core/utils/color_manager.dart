import 'package:flutter/material.dart';

/// Centralized color management for the wellness app
class ColorManager {
  // Private constructor to prevent instantiation
  const ColorManager._();

  // ========== PRIMARY COLORS ==========
  
  /// Primary brand color - Amber/Yellow theme
  static const Color primary = Color(0xFFf8cc05);
  static const Color primaryLight = Color(0xFFfbe57d);
  static const Color primaryDark = Color(0xFFe6b800);
  
  /// Secondary brand color - Orange accent
  static const Color secondary = Color(0xFFFF8C00);
  static const Color secondaryLight = Color(0xFFFFB366);
  static const Color secondaryDark = Color(0xFFE67300);

  // ========== BACKGROUND COLORS ==========
  
  /// Main background color
  static const Color background = Color(0xFFF7F7F7);
  
  /// Card and surface background
  static const Color surface = Color(0xFFFFFFFF);
  
  /// Secondary background for sections
  static const Color backgroundSecondary = Color(0xFFF5F5F5);

  // ========== TEXT COLORS ==========
  
  /// Primary text color
  static const Color textPrimary = Color(0xFF000000);
  
  /// Secondary text color
  static const Color textSecondary = Color(0xFF666666);
  
  
  
  /// Text on dark backgrounds
  static const Color textOnDark = Color(0xFFFFFFFF);

  // ========== STATUS COLORS ==========
  
  /// Success
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF81C784);
  static const Color successDark = Color(0xFF388E3C);
  
  /// Warning status
  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFB74D);
  static const Color warningDark = Color(0xFFF57C00);
  
  /// Error/Danger status
  static const Color error = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFE57373);
  static const Color errorDark = Color(0xFFD32F2F);
  
  /// Info status
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);

  /// SOS button primary color
  static const Color sosPrimary = Color(0xFFF27373);
  static const Color sosPrimaryLight = Color(0xFFF5A5A5);
  static const Color sosPrimaryDark = Color(0xFFE55555);
  
  /// SOS button background
  static const Color sosBackground = Color(0xFFF27373);

  // ========== UI ELEMENT COLORS ==========
  
  /// Border colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderLight = Color(0xFFF0F0F0);
  static const Color borderDark = Color(0xFFBDBDBD);
  
  /// Divider color
  static const Color divider = Color(0xFFE0E0E0);
  
  /// Shadow color
  static const Color shadow = Color(0x1A000000);
  
  /// Overlay color
  static const Color overlay = Color(0x80000000);

  // ========== GRADIENT COLORS ==========
  
  /// Primary gradient colors
  static const List<Color> primaryGradient = [
    Color(0xFFf8cc05),
    Color(0xFFfbe57d),
  ];
  static const List<Color> primaryGradient2 = [
    Color(0xFFf8cc05),
    Color(0xFFf8cc05),
    Color(0xFFf8cc05),
    Color.fromARGB(255, 255, 228, 92),
    Color(0xFFf8cc05),
  ];
  
  /// Create a gradient from color list
  static LinearGradient createGradient(
    List<Color> colors, {
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
  }) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: colors,
    );
  }
  
  /// Create a box shadow with app's shadow color
  static List<BoxShadow> createShadow({
    double blurRadius = 10,
    double spreadRadius = 1,
    Offset offset = const Offset(0, 5),
    double opacity = 0.1,
  }) {
    return [
      BoxShadow(
        color: shadow.withOpacity(opacity),
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
        offset: offset,
      ),
    ];
  }
  
  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}
