import 'package:art_gallery/constants/colors.dart';
import 'package:art_gallery/models/comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  final Comments comment;
  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(1, 2),
              blurRadius: 8,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.h),
            Text(
              comment.email,
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4.h),
            Text(
              comment.body,
              style: const TextStyle(color: CustomColors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
