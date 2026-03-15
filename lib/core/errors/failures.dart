abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class DuplicateFailure extends Failure {
  const DuplicateFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class ServerException implements Exception {
  final String message;
  const ServerException(this.message);

  @override
  String toString() => message;
}

class DuplicateException implements Exception {
  final String message;
  const DuplicateException(this.message);

  @override
  String toString() => message;
}
