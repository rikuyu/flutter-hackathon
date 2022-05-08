abstract class Result<T> {
  String message = "";

  T? data;
}

class Success<T> implements Result {
  @override
  late final data;

  @override
  String message;

  Success({required this.data, required this.message});
}

class Failure<T> implements Result {
  @override
  late final data;

  @override
  String message;

  Failure({required this.data, required this.message});
}