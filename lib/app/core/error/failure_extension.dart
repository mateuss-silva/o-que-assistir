import 'package:o_que_assistir/app/core/error/failure.dart';

extension FailureExtension on Failure {
  String get message {
    switch (this) {
      case ServerFailure():
        return 'Algo aconteceu com o servidor, tente mais tarde';
      default:
        return 'Erro inesperado';
    }
  }
}
