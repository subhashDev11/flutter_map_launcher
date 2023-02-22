class PostResponseModel {
  const PostResponseModel({
    this.data,
    this.message,
    this.success,
    this.status,
    this.errors,
  });

  final dynamic data;
  final String? message;
  final dynamic errors;
  final bool? success;
  final int? status;

  PostResponseModel copyWith({
    dynamic data,
    String? message,
    dynamic errors,
    bool? success,
    int? status,
  }) {
    return PostResponseModel(
      data: data ?? this.data,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      status: status ?? this.status,
      success: success ?? this.success,
    );
  }

  factory PostResponseModel.fromJson(Map<String, dynamic> mapData) {
    return PostResponseModel(
      success: mapData['success'],
      message: mapData['message'],
      status: mapData['status'],
      data: mapData['response'],
      errors: mapData['error'],
    );
  }

  Map<String, dynamic> toJson() {
    return ({
      'success': success,
      'message': message,
      'status': status,
      'response': data,
      'error': errors,
    });
  }
}
