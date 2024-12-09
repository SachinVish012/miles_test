part of '../home_screen.dart';

class BannerReelsCTAWidgets extends StatelessWidget {
  const BannerReelsCTAWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          color: ColorConstants.darkBlack,
          padding: EdgeInsets.all(
            8.widthMultiplier,
          ),
          child: Column(
            children: [
              const TitileWidget(
                title: StringConstant.theGlobalAccountant,
              ),
              10.heightBox,
              GridView.builder(
                itemCount: controller.homeData
                    .firstWhere(
                      (block) => block.blockType == BlockType.reels.stringValue,
                    )
                    .posts
                    .length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.widthMultiplier,
                  mainAxisSpacing: 10.heightMultiplier,
                ),
                itemBuilder: (context, index) {
                  final data = controller.homeData
                      .firstWhere(
                        (block) =>
                            block.blockType == BlockType.reels.stringValue,
                      )
                      .posts[index];
                  return GestureDetector(
                    onTap: () {
                      if (data.files.first.mediaType ==
                          MediaType.video.stringValue) {
                        context.push(
                          RoutesName.youtubePlayer,
                          extra: YoutubeVideoPlayerPrams(
                              videoId:
                                  Uri.parse(data.files.first.videoUrl ?? "")
                                          .queryParameters['v'] ??
                                      "",
                              thumbnailImage: data.files.first.thumbnail ?? "",
                              title: data.title),
                        );
                      }
                    },
                    child: Container(
                      height: 256.heightMultiplier,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            data.files.first.thumbnail ?? "",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
              50.heightBox,
              //---CTA
              Image.network(
                controller.homeData
                        .firstWhere(
                          (block) =>
                              block.blockType == BlockType.cta.stringValue,
                        )
                        .posts
                        .first
                        .files
                        .first
                        .imagePath ??
                    "",
              ),
              40.heightBox,
              const TitileWidget(
                title: StringConstant.upcomingEvent,
              ),
              Container(
                color: ColorConstants.darkBlack,
                padding: EdgeInsets.all(
                  8.widthMultiplier,
                ),
                child: Column(
                  children: [
                    10.heightBox,
                    Image.network(
                      controller.homeData
                              .firstWhere(
                                (block) =>
                                    block.blockType ==
                                    BlockType.events.stringValue,
                              )
                              .posts
                              .first
                              .files
                              .first
                              .imagePath ??
                          "",
                    ),
                  ],
                ),
              ),
              //-------inshorts
              40.heightBox,

              InshortWidgets(
                inShortData: controller.homeData.firstWhere(
                  (block) => block.blockType == BlockType.inShorts.stringValue,
                ),
              ),
              20.heightBox,
              MasterclassWidget(
                  masterClassData: controller.homeData.firstWhere(
                (block) => block.blockType == BlockType.masterClass.stringValue,
              )),
            ],
          ),
        );
      },
    );
  }
}
