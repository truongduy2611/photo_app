import 'package:dio/dio.dart';
import 'package:photo_app/models/photo.dart';
import 'package:photo_app/repositories/data_response.dart';

const _baseUrl = 'https://httpbin.org';
final _dio = Dio()
  ..options = BaseOptions(
    baseUrl: _baseUrl,
  );

class PhotoApiClient {
  Future<DataResponse<List<PhotoModel>>> fetchPhotoList() {
    final request = _dio.get('/get');
    return makeRequest<List<PhotoModel>>(request, processCallback: (_) {
      try {
        return [<String, dynamic>{}]
            .map((o) => PhotoModel.fromJson(o))
            .toList();
      } catch (e) {
        print(e);
      }
      return [];
    });
  }
}

class PhotoRepository {
  final api = PhotoApiClient();
}
