import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  const ProductWidget({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3.h,
        children: [
          SizedBox(
            height: 100.h,
            child: Image.network(productImage, fit: BoxFit.cover),
          ),
          Text(productName, style: TextStyle(fontSize: 14.sp)),
          Text(
            productPrice,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent,
                  textStyle: TextStyle(fontSize: 14.sp, color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0.r),
                  ),
                ),
                child: Text("Add to cart"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
