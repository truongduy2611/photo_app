import 'package:dio/dio.dart';
import 'package:photo_app/models/unsplash_photo.dart';
import 'package:photo_app/repositories/data_response.dart';

class UnsplashPhotoApiClient {
  static const baseUrl = 'https://api.unsplash.com';
  static const unsplashApiKey =
      'd354690c0d63529d862262fb0ef87a9571beacea090f6e83aacfcf27ec5f446a';
  final _dio = Dio()..options = BaseOptions(baseUrl: baseUrl);

  Future<DataResponse<List<UnsplashPhotoModel>>> fetchPhotoList({
    required int page,
  }) async {
    final request = _dio.get('/photos?page=$page&client_id=$unsplashApiKey');
    return makeRequest(request, processCallback: (data) {
      final list = data as List;
      return list.map((o) => UnsplashPhotoModel.fromJson(o)).toList();
    });
  }

  Future<DataResponse<UnsplashPhotoModel>> fetchRandomPhoto() {
    final request = _dio.get('/photos/random?client_id=$unsplashApiKey');
    return makeRequest(request, processCallback: (data) {
      return UnsplashPhotoModel.fromJson(data as Map<String, dynamic>);
    });
  }
}

class PhotoRepository {
  final api = UnsplashPhotoApiClient();
}
