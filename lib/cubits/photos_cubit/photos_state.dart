part of 'photos_cubit.dart';

abstract class PhotosState {}

class PhotosInitial extends PhotosState {}

class PhotosLoading extends PhotosState {}

class PhotosLoaded extends PhotosState {
  final List<Photos> photos;

  PhotosLoaded({
    required this.photos,
  });
}

class PhotosError extends PhotosState {
  final String? errorMessage;

  PhotosError({
    this.errorMessage,
  });
}
