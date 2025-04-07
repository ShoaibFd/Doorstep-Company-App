import 'package:doorstep_company_app/api/controllers/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../api/controllers/banner/banners_controller.dart';
import '../../components/app_text.dart';
import '../../components/show_loading.dart';
import '../../theme/colors.dart';
import '../../utils/enum/banner_enums.dart';
import '../../utils/enum/reel_enum.dart';
import '../home_screen/components/carousel_slider.dart';
import '../home_screen/components/video_player_section.dart';
import 'products/products_screen.dart';
import 'products/products_detail_screen.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  // Controllers
  final ProductsController productsController = Get.put(ProductsController());
  final bannersController = Get.put(BannersController(BannerType.offers));
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    productsController.fetchProductsType();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey300), borderRadius: BorderRadius.circular(10.r)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grey300), borderRadius: BorderRadius.circular(10.r)),
                      hintText: 'Search For Service',
                      prefixIcon: Icon(Icons.search_rounded, color: AppColors.hintGrey, size: 24.sp)))),
          SizedBox(height: 20.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (bannersController.isLoading.value) {
                      return Center(child: showLoading());
                    }
                    if (bannersController.bannerImages.isEmpty) {
                      return const SizedBox();
                    }
                    return CarouselSliderWidget(
                      height: height * .3,
                      images: bannersController.bannerImages,
                    );
                  }),
                  SizedBox(height: 20.h),
                  Obx(() {
                    if (productsController.isLoading.value) {
                      return Center(child: showLoading());
                    }
                    final products = productsController.productsTypeModel.value?.data;
                    if (productsController.productsTypeModel.value?.data == null) {
                      return const SizedBox();
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText('Shop by category', fontSize: 18.sp, fontWeight: FontWeight.bold),
                          SizedBox(height: 30.h),
                          GridView.builder(
                            itemCount: products?.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.w,
                                mainAxisSpacing: 10.h,
                                mainAxisExtent: 145.h),
                            itemBuilder: (context, index) {
                              final detailId = productsController.productsDetailsModel.value?.productDetailId;
                              final product = products?[index];
                              // final filterId =
                              //     productsController.productsFiltersModel.value?.data?.categories?[index].id;
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      Get.to(() => ProductsScreen(id: product?.id));
                                      await productsController.fetchProductsFilters(typeId: product?.id);
                                      await productsController.fetchProductsSummary(typeId: product?.id);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 6.h, right: 6.h),
                                      height: 110.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        color: AppColors.whiteTheme,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.grey300,
                                            offset: const Offset(0, 1),
                                            blurRadius: 3,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        spacing: 10.h,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            product?.productImage ?? "",
                                            height: 80.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  appText(product?.productTitle ?? "", fontWeight: FontWeight.bold)
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          const Divider(),
                          SizedBox(height: 20.h),
                          appText('Top Selling', fontSize: 18.sp, fontWeight: FontWeight.bold),
                          SizedBox(height: 20.h),
                          SizedBox(
                            height: 210.h,
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => const ProductsDetailScreen());
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 10.w, left: 6.w, top: 2.h),
                                        height: 110.h,
                                        width: 110.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.r),
                                          color: AppColors.whiteTheme,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.grey300,
                                              offset: const Offset(0, 1),
                                              blurRadius: 3,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              'https://pngimg.com/d/air_conditioner_PNG24.png',
                                              height: 80.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        appText('Air Conditioner', fontWeight: FontWeight.bold),
                                        SizedBox(height: 4.h),
                                        Row(
                                          children: [
                                            Icon(Icons.star, size: 14.sp, color: AppColors.hintGrey),
                                            SizedBox(width: 4.w),
                                            appText('4.88 (491K)', color: AppColors.hintGrey)
                                          ],
                                        ),
                                        SizedBox(height: 4.h),
                                        appText('Rs.300',
                                            decoration: TextDecoration.lineThrough, color: AppColors.hintGrey),
                                        SizedBox(height: 4.h),
                                        appText('Rs.200', color: AppColors.greenColor, fontWeight: FontWeight.bold),
                                      ],
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          const Divider(),
                          SizedBox(height: 16.h),
                          appText('Learn more with Doorstep', fontSize: 18.sp, fontWeight: FontWeight.bold),
                          SizedBox(height: 20.h),
                          VideoPlayerSection(height: 80.h, width: 400.w, reelType: ReelType.offers),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
