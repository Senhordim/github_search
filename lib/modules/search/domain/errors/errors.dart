abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {
  @override
  String toString() => 'InvalidTextError';
}

class DataSourceError implements FailureSearch {
  final String message;

  DataSourceError({required this.message});

  @override
  String toString() => 'DataSourceError';
}
