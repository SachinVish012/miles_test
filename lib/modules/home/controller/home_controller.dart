import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:test_media/core/constants/string_constant.dart';
import 'package:test_media/modules/home/repo/home_repo.dart';
import 'package:test_media/modules/home/repo/models/home_data_model.dart';

class HomeController extends GetxController {
  List bottomNavigationNameList = [
    StringConstant.home,
    StringConstant.player,
    StringConstant.trending,
    StringConstant.home,
    StringConstant.profile,
  ];
  final HomeRepo _homeRepo = HomeRepo();
  RxInt selectedIndex = 0.obs;
  RxList<BlockData> homeData = <BlockData>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

//-----load data from json
  Future<void> getHomeData() async {
    isLoading.value = true;

    update();
    try {
      final jsonData = await _homeRepo.loadJson();
      homeData.value = jsonData.data;
      log("data--$homeData");
    } catch (e, st) {
      log("Exception---$e--$st");
    } finally {
      isLoading.value = false;
      update();
    }
  }

  //---update selected index
  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
