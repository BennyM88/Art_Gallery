import 'package:art_gallery/models/photos.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoCard extends StatelessWidget {
  final Photos photo;
  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.h),
      child: Container(
        height: 150.h,
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
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: photo.thumbnailUrl,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Text(
                photo.title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
