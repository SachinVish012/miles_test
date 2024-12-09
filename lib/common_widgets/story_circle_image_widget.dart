import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_media/core/constants/assets_constant.dart';
import 'package:test_media/core/extension/size_extension.dart';
import 'package:test_media/core/extension/sizedbox_extension.dart';
import 'package:test_media/core/typography/app_textstyle.dart';

class StoryCircleWidget extends StatelessWidget {
  final String imageUrl;
  final String userName;
  const StoryCircleWidget({
    super.key,
    required this.imageUrl,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 60.heightMultiplier,
              height: 60.heightMultiplier,
              child: Image.asset(
                AssetsConstant.storyGif,
              ),
            ),
            CircleAvatar(
              radius: 24.r,
              backgroundImage:  NetworkImage(
                imageUrl,
              ),
            ),
          ],
        ),
        2.heightBox,
        Text(
          userName,
          style: AppTextStyle.r10.white.copyWith(
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
