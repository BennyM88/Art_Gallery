import 'package:art_gallery/models/comments.dart';
import 'package:art_gallery/models/photos.dart';
import 'package:art_gallery/services/network_services/art_gallery_network_service.dart';
import 'package:dio/dio.dart';

class ArtGalleryRepositoryService {
  static Future<List<Photos>> getPhotos() async {
    Response<dynamic> response = await ArtGalleryNetworkService.getPhotos();
    return List<Photos>.from(
      response.data.map(
        (photo) => Photos.fromJson(photo),
      ),
    );
  }

  static Future<List<Comments>> getComments() async {
    Response<dynamic> response = await ArtGalleryNetworkService.getComments();
    return List<Comments>.from(
      response.data.map(
        (comment) => Comments.fromJson(comment),
      ),
    );
  }
}
