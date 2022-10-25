import 'dart:async';

import 'package:art_gallery/cubits/comments_cubit/comments_cubit.dart';
import 'package:art_gallery/models/comments.dart';
import 'package:art_gallery/update_data.dart';
import 'package:art_gallery/view/widgets/comment_card.dart';
import 'package:art_gallery/view/widgets/no_internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<Comments> comments = [];

  @override
  void initState() {
    super.initState();
    unawaited(context.read<CommentsCubit>().loadComments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          if (state is CommentsLoaded) {
            comments = state.comments;
          }
          if (state is CommentsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CommentsError) {
            return NoInternet(
              retryConnection: () async => updateAllData(context),
            );
          }
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 42.h),
                  Text(
                    'title',
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return CommentCard(comment: comments[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
