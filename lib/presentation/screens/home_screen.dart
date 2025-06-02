import 'package:block_lesson/logic/product/product_bloc.dart';
import 'package:block_lesson/presentation/widgets/categories_box_widget.dart';
import 'package:block_lesson/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController(
    viewportFraction: 0.85, // Keyingi page'ning bir qismi ko'rinadi
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Delivery address", style: TextStyle(fontSize: 12.sp)),
                Row(
                  children: [
                    Text(
                      "Salatiga city, Central Java",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Icon(Icons.arrow_drop_down, size: 16.sp),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_basket, size: 18.sp),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications, size: 18.sp),
              ),
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                constraints: BoxConstraints(minHeight: 40.r, maxHeight: 50.r),
                leading: Icon(Icons.search),
                hintText: "Search here...",
              ),
              SizedBox(
                height: 150.h,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  itemCount: 3, // Slaydlar soni
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          'Slide ${index + 1}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                "Categories",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  spacing: 9.w,
                  children: [
                    CategoriesBoxWidget(
                      title: "Apparel",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuw1KDADuCTOh3So8oFJiSoIbx-sfKrCzyMQ&s",
                    ),
                    CategoriesBoxWidget(
                      title: "School",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgQodOhDyNB2eX6pamPIuQORwBzl1ml-AtCw&s",
                    ),
                    CategoriesBoxWidget(
                      title: "Sports",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNu8b-xR2e1zuaZ0sDCpKFT8dz25mVLGqcC5gC-DL2pQxr3BTH_W713ug&s",
                    ),
                    CategoriesBoxWidget(
                      title: "Electronics",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM3lgc0ZmvYspc1I57FdJKL70JHPvkx_IgslmbjG2QwRDavNYQ0yFVAGQ&s",
                    ),
                    CategoriesBoxWidget(
                      title: "All",
                      image:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSslgFI0Wft78AFEdSO6weT5jxu7tsEacY8tQ&s",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Filters", style: TextStyle(fontSize: 14.sp)),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.filter_list, size: 18.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ...[
                if (state is ProductLoading)
                  Center(child: CircularProgressIndicator())
                else if (state is ProductError)
                  Center(child: Text("Error: ${state.message}"))
                else if (state is ProductLoaded)
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(10.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ProductWidget(
                          productName: product.title,
                          productImage: product.image,
                          productPrice: "\$${product.price.toStringAsFixed(2)}",
                        );
                      },
                    ),
                  ),
              ]
            ],
          ),
        );
      },
    );
  }
}
