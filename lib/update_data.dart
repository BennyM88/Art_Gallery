// ignore_for_file: use_build_context_synchronously

import 'package:art_gallery/cubits/comments_cubit/comments_cubit.dart';
import 'package:art_gallery/cubits/photos_cubit/photos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> updateAllData(BuildContext context) async {
  await context.read<PhotosCubit>().loadPhotos();
  await context.read<CommentsCubit>().loadComments();
}
