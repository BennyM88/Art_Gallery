import 'package:art_gallery/dio_exceptions.dart';
import 'package:art_gallery/models/comments.dart';
import 'package:art_gallery/services/repository_services/art_gallery_repository_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());

  Future<void> loadComments() async {
    emit(CommentsLoading());
    try {
      List<Comments> allComments =
          await ArtGalleryRepositoryService.getComments();
      emit(CommentsLoaded(comments: allComments));
    } on DioError catch (e) {
      emit(
        CommentsError(
          errorMessage: DioExceptions.fromDioError(e).toString(),
        ),
      );
    }
  }
}
