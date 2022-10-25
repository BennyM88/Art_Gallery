import 'package:art_gallery/main.dart';
import 'package:art_gallery/services/network_services/network_service.dart';
import 'package:dio/dio.dart';

class ArtGalleryNetworkService {
  static Future<Response<dynamic>> getPhotos() async {
    Response<dynamic> response =
        await networkService.get('${NetworkService.baseUrl}/photos');
    return response;
  }

  static Future<Response<dynamic>> getComments() async {
    Response<dynamic> response =
        await networkService.get('${NetworkService.baseUrl}/comments');
    return response;
  }
}
