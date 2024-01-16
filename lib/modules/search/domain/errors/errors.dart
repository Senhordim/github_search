abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {
  @override
  String toString() => 'InvalidTextError';
}
