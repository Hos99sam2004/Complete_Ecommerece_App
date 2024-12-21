part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}


final class HomeBannerLoading extends HomeState {}

final class HomeBannerSuccess extends HomeState {}

final class HomeBannerError extends HomeState {}



final class HomeCategorieLoading extends HomeState {}

final class HomeCategorieSuccess extends HomeState {}

final class HomeCategorieError extends HomeState {
  final String msg;

  HomeCategorieError(this.msg);
}


final class HomeProductsLoading extends HomeState {}

final class HomeProductsSuccess extends HomeState {}

final class HomeProductsFavorite extends HomeState {}

final class HomeProductsError extends HomeState {
  final String msg;
  HomeProductsError(this.msg);
}

final class HomeScreenChange extends HomeState {}



final class HomeFavoritesSuccess extends HomeState {}

final class HomeFavoritesError extends HomeState {
  final String msg;
  HomeFavoritesError(this.msg);
}


final class HomeGetFavoLoading extends HomeState {}
final class HomeGetFavoSuccess extends HomeState {}

final class HomeGetFavoError extends HomeState {}

