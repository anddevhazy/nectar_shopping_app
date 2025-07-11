class ServerException implements Exception {}

class CacheException implements Exception {}

class RiderLoginException implements Exception {
  final String message;
  RiderLoginException(this.message);

  @override
  String toString() => 'RiderLoginException: $message';
}

class CheckingProfileImageException implements Exception {
  final String message;
  CheckingProfileImageException(this.message);

  @override
  String toString() => 'CheckingProfileImageException: $message';
}

class UploadProfileImageException implements Exception {
  final String message;
  UploadProfileImageException(this.message);

  @override
  String toString() => 'UploadProfileImageException: $message';
}
