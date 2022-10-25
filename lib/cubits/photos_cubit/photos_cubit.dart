import 'package:art_gallery/dio_exceptions.dart';
import 'package:art_gallery/models/photos.dart';
import 'package:art_gallery/services/repository_services/art_gallery_repository_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(PhotosInitial());

  Future<void> loadPhotos() async {
    emit(PhotosLoading());
    try {
      List<Photos> allPhotos = await ArtGalleryRepositoryService.getPhotos();
      emit(PhotosLoaded(photos: allPhotos));
    } on DioError catch (e) {
      emit(
        PhotosError(
          errorMessage: DioExceptions.fromDioError(e).toString(),
        ),
      );
    }
  }
}
