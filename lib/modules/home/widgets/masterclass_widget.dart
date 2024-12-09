import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_media/core/constants/assets_constant.dart';
import 'package:test_media/core/constants/string_constant.dart';
import 'package:test_media/core/extension/size_extension.dart';
import 'package:test_media/core/extension/sizedbox_extension.dart';
import 'package:test_media/core/typography/app_textstyle.dart';
import 'package:test_media/modules/home/repo/models/home_data_model.dart';
import 'package:test_media/modules/home/widgets/titile_widget.dart';

class MasterclassWidget extends StatelessWidget {
  final BlockData masterClassData;
  const MasterclassWidget({super.key, required this.masterClassData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitileWidget(
          title: StringConstant.ourProgram,
        ),
        10.heightBox,
        SizedBox(
          height: 360.heightMultiplier,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                top: 20,
                bottom: 20,
                child: Image.asset(
                  AssetsConstant.masterClassBackgroundImg1,
                  height: 320.heightMultiplier,
                ),
              ),
              Positioned(
                top: 20,
                bottom: 20,
                right: 0,
                child: Image.asset(
                  AssetsConstant.masterClassBackgroundImg2,
                  height: 320.heightMultiplier,
                ),
              ),
              Container(
                height: 360.heightMultiplier,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 360.heightMultiplier,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    aspectRatio: 16 / 9,
                    initialPage: 0,
                  ),
                  items: masterClassData.posts.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Center(
                          child: Container(
                            width: 248.widthMultiplier,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                imageUrl.files.first.imagePath ?? "",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        50.heightBox,
        Text(
          StringConstant.flagbearerFor,
          style: AppTextStyle.b24.white,
        ),
        Text(
          StringConstant.accountants,
          style: AppTextStyle.b24.white.copyWith(
            fontSize: 36.sp,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Created with ",
                style: AppTextStyle.r12.white,
              ),
              WidgetSpan(
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 16.heightMultiplier,
                ),
              ),
              TextSpan(
                text: " at Miles Education",
                style: AppTextStyle.r12.white,
              ),
            ],
          ),
        ),
        30.heightBox,
      ],
    );
  }
}
