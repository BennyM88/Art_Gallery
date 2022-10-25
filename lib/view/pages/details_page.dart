import 'package:art_gallery/models/photos.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatelessWidget {
  final Photos photo;
  const DetailsPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 42.h),
              IconButton(
                onPressed: () => Navigator.pop(context),
                iconSize: 32.h,
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
              ),
              SizedBox(height: 20.h),
              CachedNetworkImage(
                imageUrl: photo.url,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'album id:',
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'id:',
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 24.w),
                  Column(
                    children: [
                      Text(
                        photo.albumId.toString(),
                        style: TextStyle(
                          fontSize: 32.sp,
                        ),
                      ),
                      Text(
                        photo.id.toString(),
                        style: TextStyle(
                          fontSize: 32.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
