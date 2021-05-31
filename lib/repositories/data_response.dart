import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart' show DioErrorType;
import 'package:photo_app/generated/l10n.dart';

typedef ProcessCallback<T> = T Function(Map<String, dynamic> responseData);

enum Status { success, error, connectivityError }

class DataResponse<T> {
  DataResponse.success(this.data, {this.total, String? message})
      : status = Status.success {
    this.message = message ?? S.current.fetchApiSuccessfully;
  }

  DataResponse.error({String? message}) : status = Status.error {
    this.message = message ?? S.current.defaultErrorMessage;
  }

  DataResponse.connectivityError({String? message})
      : status = Status.connectivityError {
    this.message = message ?? S.current.defaultNetworkErrorMessage;
  }

  Status status;
  T? data;
  int? total;
  late String message;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }

  bool get isSuccess => status == Status.success;
}

int _getTotal(Map<String, dynamic> response) {
  try {
    final payload = response['payload'] as Map;
    return payload['total'] as int;
  } catch (_) {
    return 0;
  }
}

Future<DataResponse<T>> makeRequest<T>(
  Future<dio.Response> request, {
  ProcessCallback<T>? processCallback,
}) async {
  try {
    final response = await request;

    if (response.statusCode != 200) {
      return DataResponse.error(
          message: (response.data as Map)['message'].toString());
    } else {
      return DataResponse.success(
        processCallback != null
            ? processCallback.call(response.data)
            : response.data as T,
        total: _getTotal(response.data),
      );
    }
  } catch (e) {
    if (e is dio.DioError) {
      if (e.error is SocketException) {
        return DataResponse.connectivityError();
      }

      if (e.type == DioErrorType.response) {
        final response = e.response;
        try {
          return DataResponse.error(
              message: (response!.data as Map)['message'].toString());
        } catch (_) {}
      }
    }

    return DataResponse.error();
  }
}
