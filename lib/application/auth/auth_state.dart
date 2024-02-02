part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
    @Default(null) String? phoneNumber,
    @Default(null) bool? isLogged,
  }) = _AuthState;
}
