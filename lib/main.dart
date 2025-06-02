import 'package:block_lesson/logic/product/product_bloc.dart';
import 'package:block_lesson/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => ProductBloc()..add(LoadProductsEvent()),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
