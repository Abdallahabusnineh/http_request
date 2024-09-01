class ErrorMessageModel  {
  final String message;

  const ErrorMessageModel({
    required this.message,
  });

  factory ErrorMessageModel.fromJson(String message) =>
      ErrorMessageModel(
        message: message,
      );
}
