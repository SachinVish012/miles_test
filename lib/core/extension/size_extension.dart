

import 'package:test_media/core/services/size_config.dart';

extension SizeExtension on num {
  double get widthMultiplier => this * SizeConfig.widthMultiplier;
  double get heightMultiplier => this * SizeConfig.heightMultiplier;
  double get imageSizeMultiplier => this * SizeConfig.imageSizeMultiplier;
  double get textMultiplier => this * SizeConfig.textMultiplier;
}
