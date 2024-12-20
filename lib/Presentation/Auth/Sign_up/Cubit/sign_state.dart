part of 'sign_cubit.dart';

@immutable
sealed class SignState {}

final class SignInitial extends SignState {}
final class SignLoading extends SignState {}
final class SignSuccess extends SignState {
  final String msg;
  SignSuccess(this.msg);
}
final class SignError extends SignState {
  final String msg;
  SignError(this.msg);
}