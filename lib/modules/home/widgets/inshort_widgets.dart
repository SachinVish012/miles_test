import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_media/common_widgets/youtube_video_player.dart';
import 'package:test_media/core/constants/assets_constant.dart';
import 'package:test_media/core/constants/color_constants.dart';
import 'package:test_media/core/constants/string_constant.dart';
import 'package:test_media/core/enum/enum.dart';
import 'package:test_media/core/extension/size_extension.dart';
import 'package:test_media/core/extension/sizedbox_extension.dart';
import 'package:test_media/core/routes/routes_name.dart';
import 'package:test_media/core/typography/app_textstyle.dart';
import 'package:test_media/modules/home/repo/models/home_data_model.dart';
import 'package:test_media/modules/home/widgets/titile_widget.dart';

class InshortWidgets extends StatelessWidget {
  final BlockData inShortData;
  const InshortWidgets({super.key, required this.inShortData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitileWidget(
          title: StringConstant.accountUnplugged,
        ),
        10.heightBox,
        ListView.builder(
          itemCount: inShortData.posts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = inShortData.posts[index];
            return GestureDetector(
              onTap: () {
                if (data.files.first.mediaType == MediaType.video.stringValue) {
                  context.push(
                    RoutesName.youtubePlayer,
                    extra: YoutubeVideoPlayerPrams(
                        videoId: Uri.parse(data.files.first.videoUrl ?? "")
                                .queryParameters['v'] ??
                            "",
                        thumbnailImage: data.files.first.thumbnail ?? "",
                        title: data.title),
                  );
                }
              },
              child: Container(
                height: 240.heightMultiplier,
                padding: EdgeInsets.all(10.heightMultiplier),
                margin: EdgeInsets.only(bottom: 10.heightMultiplier),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: const LinearGradient(
                    colors: [
                      ColorConstants.lightBlue,
                      ColorConstants.darkBlue,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 170.heightMultiplier,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        image: DecorationImage(
                          image: NetworkImage(
                            data.files.first.thumbnail ?? "",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 32.heightMultiplier,
                          height: 32.heightMultiplier,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: SweepGradient(
                              colors: [
                                Color(0xFF00F9D2),
                                Color(0xFFF752AC),
                                Color(0xFF3921FC),
                                Color(0xFFFFEB34),
                                Color(0xFF00F9D2),
                              ],
                              startAngle: 0.0,
                              endAngle: 3.14 * 2,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 28.heightMultiplier,
                              height: 28.heightMultiplier,
                              padding: EdgeInsets.all(2.heightMultiplier),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConstants.white,
                              ),
                              child: SvgPicture.asset(
                                  AssetsConstant.milesLogoBlue),
                            ),
                          ),
                        ),
                        4.widthBox,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: AppTextStyle.r12.white.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${data.likes} Likes",
                              style: AppTextStyle.r12.grey.copyWith(
                                fontWeight: FontWeight.w300,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
