import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesBoxWidget extends StatelessWidget {
  const CategoriesBoxWidget({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 60.w,
          height: 60.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0.r),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
        Text(title, style: TextStyle(fontSize: 14.sp)),
      ],
    );
  }
}
