abstract class AppException implements Exception {
  final String? message;

  AppException({this.message});

  @override
  String toString() => message!;
}

class RemoteException extends AppException {
  RemoteException({super.message});
}

class RepositoryException extends AppException {
  RepositoryException({super.message});
}
