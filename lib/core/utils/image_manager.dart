import 'package:task_pr/core/utils/constants.dart';

class ImageManager {
  ImageManager._();

  static ImageManager get instance => ImageManager._();

  static const String imagesPath = ConstantsManager.assetsImages;
  static const String iconsPath = ConstantsManager.assetsIcons;
  static const String fontsPath = ConstantsManager.assetsFonts;


  // icons
  static const String check = '${iconsPath}check.svg';
  static const String clock = '${iconsPath}clock.svg';
  static const String date = '${iconsPath}date.svg';
  static const String notification = '${iconsPath}notification.svg';
  static const String reload = '${iconsPath}reload.svg';
  static const String settings = '${iconsPath}settings.svg';


  // images
  static const String logo = '${imagesPath}logo-devoteam.svg';
  static const String blood = '${imagesPath}blood.svg';
  static const String heart = '${imagesPath}heart.svg';
  static const String noise = '${imagesPath}noise.svg';
  static const String respiratory = '${imagesPath}respiratory.svg';
  static const String stress = '${imagesPath}stress.svg';
  static const String temp = '${imagesPath}temp.svg';
  
}