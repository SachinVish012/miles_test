import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:test_media/common_widgets/story_circle_image_widget.dart';
import 'package:test_media/common_widgets/youtube_video_player.dart';
import 'package:test_media/core/constants/assets_constant.dart';
import 'package:test_media/core/constants/color_constants.dart';
import 'package:test_media/core/constants/string_constant.dart';
import 'package:test_media/core/enum/enum.dart';
import 'package:test_media/core/extension/size_extension.dart';
import 'package:test_media/core/extension/sizedbox_extension.dart';
import 'package:test_media/core/routes/routes_name.dart';
import 'package:test_media/core/typography/app_textstyle.dart';
import 'package:test_media/modules/home/controller/home_controller.dart';

import 'package:test_media/modules/home/widgets/inshort_widgets.dart';
import 'package:test_media/modules/home/widgets/masterclass_widget.dart';
import 'package:test_media/modules/home/widgets/titile_widget.dart';
part 'widgets/grid_background.dart';
part 'widgets/stories_widgets.dart';
part 'widgets/reels_cta_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkBlack,
      appBar: AppBar(
        backgroundColor: ColorConstants.darkBlack,
        title: SvgPicture.asset(
          AssetsConstant.milesLogoTransparent,
          height: 18.heightMultiplier,
          width: 58.widthMultiplier,
        ),
        actions: [
          SvgPicture.asset(
            AssetsConstant.bellIcon,
            height: 20.heightMultiplier,
            width: 20.heightMultiplier,
          ),
          20.widthBox,
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: () => controller.getHomeData(),
            child: Stack(
              children: [
                // ----background grid
                const GridBackground(),

                controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            10.heightBox,
                            Container(
                              color: ColorConstants.darkBlack,
                              padding: EdgeInsets.all(
                                8.widthMultiplier,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstant.goodMornig,
                                          style:
                                              AppTextStyle.r16.white.copyWith(
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        Text(
                                          "Shivam",
                                          style: AppTextStyle.med14.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Image.asset(
                                        AssetsConstant.callGif,
                                        height: 38.heightMultiplier,
                                        width: 114.widthMultiplier,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //----Story widget
                            const StoriesWidgets(),
                            10.heightBox,
                            //---banner

                            Image.network(
                              controller.homeData
                                      .firstWhere(
                                        (block) =>
                                            block.blockType ==
                                            BlockType.banner.stringValue,
                                      )
                                      .posts
                                      .first
                                      .files
                                      .first
                                      .imagePath ??
                                  "",
                              height: 284.heightMultiplier,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            20.heightBox,
                            const BannerReelsCTAWidgets(),
                          ],
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
