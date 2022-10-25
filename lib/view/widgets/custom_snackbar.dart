import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar internetConnectionSnackBar(
    String label,
    Color color,
    IconData icon,
    Duration duration,
  ) {
    return SnackBar(
      duration: duration,
      elevation: 0,
      backgroundColor: color,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
          ),
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    );
  }
}
