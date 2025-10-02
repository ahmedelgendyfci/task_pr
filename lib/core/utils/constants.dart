/// Application-wide constants
class ConstantsManager {
  // API
  static const String baseUrl = '';
  static const Duration apiTimeout = Duration(seconds: 30);

  // UI
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 8.0;
  
  // Assets
  static const String assetsImages = 'assets/images/';
  static const String assetsIcons = 'assets/icons/';
  static const String assetsFonts = 'assets/fonts/';
  
  // Private constructor to prevent instantiation
  const ConstantsManager._();
}
