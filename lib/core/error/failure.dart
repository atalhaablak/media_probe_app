abstract class Failure {
  String get message;
}

class NotFoundFailure implements Failure {
  @override
  String get message => "Json Not Found";
}
