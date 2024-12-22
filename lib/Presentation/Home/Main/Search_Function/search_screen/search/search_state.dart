part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

final class HomeSearchLoading extends SearchState {}

final class HomeSearchSuccess extends SearchState {}

final class HomeSearchError extends SearchState {}
