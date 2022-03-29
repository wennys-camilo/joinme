abstract class Failure {
  final String message;
  final StackTrace stackTrace;

  const Failure(this.message, this.stackTrace);
}

class DatasourceFailure extends Failure {
  DatasourceFailure({required String message, required StackTrace stackTrace})
      : super(message, stackTrace);
}

class DomainFailure extends Failure {
  DomainFailure({required String message, required StackTrace stackTrace})
      : super(message, stackTrace);
}

class ApiFailure extends DatasourceFailure {
  ApiFailure({
    String message = 'O servidor encontrou um erro ao processar a solicitação.',
    required StackTrace stackTrace,
  }) : super(message: message, stackTrace: stackTrace);
}
