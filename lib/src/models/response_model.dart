class ResponseModel {
  final dynamic data;
  final bool? success;
  final String? message;
  final int? statusCode;

  ResponseModel({
    this.data = const {},
    this.message,
    this.success,
    this.statusCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': this.data,
      'message': this.message,
      'success': this.success,
      'statusCode': this.statusCode,
    };
  }
}
