import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_media/core/constants/assets_constant.dart';
import 'package:test_media/core/extension/size_extension.dart';
import 'package:test_media/core/typography/app_textstyle.dart';
import 'package:test_media/modules/home/controller/home_controller.dart';
import 'package:test_media/modules/home/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return controller.homeData.isEmpty
              ? const SizedBox.shrink()
              : const HomeScreen();
        },
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (controller) {
          return CustomPaint(
            painter: CircularNavPainter(),
            child: SizedBox(
              height: 80.heightMultiplier,
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: 10.heightMultiplier,
                    child: IconButton(
                      icon: Icon(
                        Icons.home,
                        color: controller.selectedIndex.value == 0
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () => controller.updateSelectedIndex(0),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.3,
                    top: 0,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AssetsConstant.playerIcon,
                        color: controller.selectedIndex.value == 1
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () => controller.updateSelectedIndex(1),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.5 - 20,
                    top: -10,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AssetsConstant.tourchIcon,
                        color: controller.selectedIndex.value == 2
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () => controller.updateSelectedIndex(2),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.3,
                    top: 0,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AssetsConstant.calenderIcon,
                        color: controller.selectedIndex.value == 3
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () => controller.updateSelectedIndex(3),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.1,
                    top: 15,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AssetsConstant.profileIcon,
                        color: controller.selectedIndex.value == 4
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () => controller.updateSelectedIndex(4),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        controller.bottomNavigationNameList[
                            controller.selectedIndex.value],
                        style: AppTextStyle.b10.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CircularNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF050c1b)
      ..style = PaintingStyle.fill;

    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.moveTo(0, height * 0.4);
    path.quadraticBezierTo(width * 0.5, -height * 0.6, width, height * 0.4);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
