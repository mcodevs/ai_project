import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError(String message) = ServerError;
  const factory Failure.networkError(String message) = NetworkError;
  const factory Failure.invalidCredential(String message) = InvalidCredential;
  const factory Failure.unknown(String message) = Unknown;
}
