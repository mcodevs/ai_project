part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;
  const factory AuthEvent.sendOTP({
    required String phoneNumber,
  }) = _SendOTP;

  const factory AuthEvent.login({
    required String phoneNumber,
    required String code,
  }) = _Login;

  const factory AuthEvent.logout() = _LogOut;
}
