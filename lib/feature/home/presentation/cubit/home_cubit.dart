import 'package:bookia_store/feature/home/data/model/bestseller/bestseller.dart';
import 'package:bookia_store/feature/home/data/model/bestseller/product.dart';
import 'package:bookia_store/feature/home/data/model/slider/slider.dart';
import 'package:bookia_store/feature/home/data/repo/home_repo.dart';
import 'package:bookia_store/feature/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());

//   Future<void> getHomeData() async {
//     emit(HomeLoadingState());

//     try {
//       final sliderFuture = HomeRepo.getSlider();
//       final bestsellerFuture = HomeRepo.getBestSeller();

//       final results = await Future.wait([sliderFuture, bestsellerFuture]);

//       final slider = results[0] as Slider?;
//       final bestseller = results[1] as Bestseller?;

//       if (slider == null || bestseller == null) {
//         emit(HomeFailureState(message: 'Failed to load data'));
//         return;
//       }

//       emit(HomeLoadedState(slider: slider, bestseller: bestseller));
//     } catch (e) {
//       emit(HomeFailureState(message: e.toString()));
//     }
//   }
// }

class SubjectCubit extends Cubit<HomeState> {
  SubjectCubit() : super(HomeInitial());
  List<Slider>? sliders = [];
  List<Product>? products = [];

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    var result = await Future.wait([
      HomeRepo.getSlider(),
      HomeRepo.getBestSeller(),
    ]);
    var sliderResponse = result[0] as Slider?;
    var bestsellerResponse = result[1] as Bestseller?;
    if (sliderResponse != null || bestsellerResponse != null) {
      sliders = sliderResponse?.data?.sliders ?? [];
      products = bestsellerResponse?.data?.products ?? [];
      emit(HomeLoadedState());
    } else {
      emit(HomeFailureState(message: 'Failed to load data'));
    }
  }
}
