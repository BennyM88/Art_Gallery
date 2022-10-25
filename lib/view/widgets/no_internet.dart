import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternet extends StatelessWidget {
  final VoidCallback retryConnection;
  final String? errorMessage;

  const NoInternet({
    super.key,
    required this.retryConnection,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: 44.h,
          ),
          SizedBox(height: 2.h),
          const Text(
            'no internet connection',
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: retryConnection,
            child: const Text(
              'RETRY',
            ),
          ),
        ],
      ),
    );
  }
}
