import 'dart:async';

import 'package:art_gallery/cubits/photos_cubit/photos_cubit.dart';
import 'package:art_gallery/models/photos.dart';
import 'package:art_gallery/update_data.dart';
import 'package:art_gallery/view/pages/details_page.dart';
import 'package:art_gallery/view/widgets/no_internet.dart';
import 'package:art_gallery/view/widgets/photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  List<Photos> photos = [];

  @override
  void initState() {
    super.initState();
    unawaited(context.read<PhotosCubit>().loadPhotos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotosCubit, PhotosState>(
        builder: (context, state) {
          if (state is PhotosLoaded) {
            photos = state.photos;
          }
          if (state is PhotosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PhotosError) {
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
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  photo: photos[index],
                                ),
                              ),
                            );
                          },
                          child: PhotoCard(
                            photo: photos[index],
                          ),
                        );
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
