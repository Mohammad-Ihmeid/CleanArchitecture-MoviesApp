import 'package:movies_app/core/network/error_message_model.dart';

class RemoteExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  const RemoteExceptions({
    required this.errorMessageModel,
  });
}

class LocalDataSource implements Exception {
  final String message;

  LocalDataSource({
    required this.message,
  });
}
