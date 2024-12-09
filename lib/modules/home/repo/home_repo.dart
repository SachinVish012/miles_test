import 'dart:convert';


import 'package:flutter/services.dart';
import 'package:test_media/core/constants/assets_constant.dart';
import 'package:test_media/modules/home/repo/models/home_data_model.dart';

class HomeRepo {
  Future<HomeDataModel> loadJson() async {
    final jsonString = await rootBundle.loadString(AssetsConstant.homeJson);
    final jsonResponse = json.decode(jsonString);

    return HomeDataModel.fromJson(jsonResponse);
  }
}
