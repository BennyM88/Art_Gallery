part of 'comments_cubit.dart';

abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<Comments> comments;

  CommentsLoaded({
    required this.comments,
  });
}

class CommentsError extends CommentsState {
  final String? errorMessage;

  CommentsError({
    this.errorMessage,
  });
}
