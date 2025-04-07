import 'dart:developer';

import 'package:doorstep_company_app/api/controllers/products/products_controller.dart';
import 'package:doorstep_company_app/components/app_text.dart';
import 'package:doorstep_company_app/components/custom_container.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:doorstep_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'products_detail_screen.dart';

class ProductsScreen extends StatelessWidget {
  final ACScreenController controller = Get.put(ACScreenController());
  final ProductsController productsController = Get.put(ProductsController());

  ProductsScreen({super.key, this.id});
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        backgroundColor: AppColors.whiteTheme,
        title: Container(
            margin: EdgeInsets.only(right: 30.w, top: 4.h),
            child: TextFormField(
                // controller: searchController,
                decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey300), borderRadius: BorderRadius.circular(8.r)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey300), borderRadius: BorderRadius.circular(8.r)),
                    hintText: 'Start searching..',
                    prefixIcon: Icon(Icons.search_rounded, color: AppColors.hintGrey, size: 24.sp)))),
      ),
      body: Obx(() {
        if (productsController.isLoading.value) {
          return Center(child: showLoading());
        }
        final filters = productsController.productsFiltersModel.value?.data;
        if (filters == null) {
          return Center(child: appText('Nothing found!', fontSize: 15.sp));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),

              // Filters Row
              Obx(() {
                final categories = filters.categories;
                final selectedFilters = controller.selectedFilters;
                final typeData = productsController.productsTypeModel.value?.data ?? [];
                final summaryData = productsController.productsSummaryModel.value?.data ?? [];

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Badge for selected filters
                      IconButton(
                        onPressed: () {},
                        icon: Badge.count(
                          count: selectedFilters.where((e) => e).length,
                          child: const Icon(Icons.filter_alt_rounded),
                        ),
                      ),

                      // Show message if no categories
                      if (categories == null || categories.isEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: appText("No categories available", color: AppColors.hintGrey),
                        )
                      else
                        SizedBox(
                          height: 40.h,
                          child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final category = categories[index];

                              // Safe index check to prevent RangeError
                              final typeId = index < typeData.length ? typeData[index].id : null;
                              final sumId = index < summaryData.length ? summaryData[index].id : null;
                              final isSelected = index < selectedFilters.length ? selectedFilters[index] : false;

                              return CustomContainer(
                                onTap: () {
                                  controller.toggleFilter(index);
                                  if (sumId != null) {
                                    productsController.fetchProductsFilters(sumId: sumId);
                                  }
                                  if (typeId != null) {
                                    productsController.fetchProductsSummary(typeId: typeId);
                                  }
                                },
                                height: 34.h,
                                width: 115.w,
                                borderRadius: 40.r,
                                margin: EdgeInsets.only(right: 8.w),
                                color: isSelected ? AppColors.blueColor : AppColors.transparentColor,
                                borderColor: isSelected ? AppColors.blueColor : AppColors.hintGrey,
                                child: Center(
                                  child: appText(
                                    category.categoryName ?? "",
                                    color: isSelected ? AppColors.whiteTheme : AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                );
              }),

              // Products List
              Obx(() {
                if (productsController.isLoading.value) {
                  return Center(child: showLoading());
                }
                final products = productsController.productsSummaryModel.value?.data;
                if (products == null || products.isEmpty) {
                  return Center(child: appText('Nothing found!'));
                }
                return ListView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    final price = product.price ?? 0;
                    final discountPercentage = int.tryParse(product.discount.toString() ?? '') ?? 0;
                    final discountPrice = price - (price * discountPercentage / 100);

                    final summaryId = product.id;
                    final typeId = productsController.productsTypeModel.value?.data?[index].id;

                    return GestureDetector(
                      onTap: () async {
                        Get.to(() => ProductsDetailScreen(typeId: typeId, detailId: summaryId));
                        await productsController.fetchProductsFaqs(summaryId ?? 0);
                        await productsController.fetchProductsDetails(typeId: typeId, summaryId: summaryId);
                        log('In AC Screen → typeId: $typeId, summaryId: $summaryId');
                      },
                      child: Container(
                          margin: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey300),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(children: [
                            // Product Image
                            Container(
                              height: 120.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                image: DecorationImage(
                                  image: NetworkImage(product.previewImage ?? ""),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),

                            // Product Details
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appText(product.productName ?? "", fontSize: 16.sp, fontWeight: FontWeight.bold),
                                    Row(
                                      children: [
                                        Icon(Icons.star, size: 16.sp),
                                        SizedBox(width: 6.w),
                                        appText('4.8(12)', color: AppColors.hintGrey),
                                        SizedBox(width: 8.w),
                                        appText('142 sold', color: AppColors.hintGrey),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        appText(product.price.toString(), decoration: TextDecoration.lineThrough),
                                        SizedBox(width: 10.w),
                                        appText(discountPrice.toString() ?? "", fontWeight: FontWeight.bold),
                                      ],
                                    ),
                                    SizedBox(height: 4.h),
                                    appText("Model: ${product.model ?? ""}"),
                                    SizedBox(height: 4.h),
                                    appText("Capacity: ${product.capacity ?? ""}"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomContainer(
                                          height: 30.h,
                                          borderRadius: 4.r,
                                          color: AppColors.greenColor,
                                          child: Padding(
                                            padding: EdgeInsets.all(2.w),
                                            child: Row(
                                              children: [
                                                Image.asset('assets/images/delivery.png',
                                                    color: AppColors.whiteTheme, height: 26.h),
                                                SizedBox(width: 4.w),
                                                appText("Rs. ${product.deliveryCharges?.toString() ?? ""}",
                                                    color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
                                              ],
                                            ),
                                          ),
                                        ),
                                        CustomContainer(
                                          height: 30.h,
                                          borderRadius: 4.r,
                                          color: AppColors.redColor,
                                          child: Padding(
                                            padding: EdgeInsets.all(6.w),
                                            child: appText("${product.discount}% OFF",
                                                color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: controller.toggleLike,
                                          icon: Obx(() => Icon(
                                                controller.isLiked.isTrue ? Icons.favorite : Icons.favorite_outline,
                                                size: 28.sp,
                                                color: controller.isLiked.isTrue
                                                    ? AppColors.redColor
                                                    : AppColors.blackColor,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ])),
                    );
                  },
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}

// Controller
class ACScreenController extends GetxController {
  RxList<bool> selectedFilters = <bool>[].obs;
  RxBool isLiked = false.obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initializeFilters();
  }

  void initializeFilters() {
    final categoryCount = Get.find<ProductsController>().productsFiltersModel.value?.data?.categories?.length ?? 0;
    selectedFilters.value = List.generate(categoryCount, (index) => false);
  }

  void toggleFilter(int index) {
    if (index >= 0 && index < selectedFilters.length) {
      selectedFilters[index] = !selectedFilters[index];
    }
  }

  void toggleLike() {
    isLiked.toggle();
  }
}
