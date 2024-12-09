import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_media/core/constants/color_constants.dart';
import 'package:test_media/core/extension/size_extension.dart';
import 'package:test_media/core/extension/sizedbox_extension.dart';
import 'package:test_media/core/typography/app_textstyle.dart';

class TitileWidget extends StatelessWidget {
  final String title;
  const TitileWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.med16.white,
        ),
        const Spacer(),
        Container(
          width: 100.widthMultiplier,
          height: 4.heightMultiplier,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstants.darkBlack,
                ColorConstants.white.withOpacity(0.4),
                ColorConstants.white.withOpacity(0.6),
                ColorConstants.orange.withOpacity(0.8),
                ColorConstants.orange,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        6.widthBox,
        Container(
          width: 32.widthMultiplier,
          height: 4.heightMultiplier,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        6.widthBox,
        Container(
          width: 16.widthMultiplier,
          height: 4.heightMultiplier,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
      ],
    );
  }
}
