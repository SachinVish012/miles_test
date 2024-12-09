part of '../home_screen.dart';

class StoriesWidgets extends StatelessWidget {
  const StoriesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.heightMultiplier,
      color: ColorConstants.darkBlack,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 4.widthMultiplier, vertical: 10.heightMultiplier),
            child: const StoryCircleWidget(
              imageUrl:
                  "https://images.unsplash.com/photo-1564564295391-7f24f26f568b",
              userName: "User Name",
            ),
          );
        },
      ),
    );
  }
}
