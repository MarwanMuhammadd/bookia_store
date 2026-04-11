import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:bookia_store/core/service/Apis/apis.dart';
import 'package:bookia_store/core/service/Apis/dio_provider.dart';
import 'package:bookia_store/feature/home/data/model/bestseller/bestseller.dart';
import 'package:bookia_store/feature/home/data/model/slider/slider.dart';

class HomeRepo {
  static Future<Slider?> getSlider() async {
    try {
      var response = await DioProvider.get(endPoint: Apis.slider);
      if (response.statusCode == 200) {
        return Slider.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Bestseller?> getBestSeller() async {
    try {
      var response = await DioProvider.get(endPoint: Apis.bestseller);
      if (response.statusCode == 200) {
        return Bestseller.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
