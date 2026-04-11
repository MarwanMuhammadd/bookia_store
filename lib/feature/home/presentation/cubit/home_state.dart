import 'package:bookia_store/feature/home/data/model/bestseller/bestseller.dart';
import 'package:bookia_store/feature/home/data/model/slider/slider.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {


  HomeLoadedState();
}

class HomeFailureState extends HomeState {
  final String? message;

  HomeFailureState({this.message});
}
