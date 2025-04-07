import 'dart:developer';

import 'package:doorstep_company_app/api/controllers/products/products_controller.dart';
import 'package:doorstep_company_app/components/custom_snackbar.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../components/app_text.dart';
import '../../../components/bottom_sheet/review_bottom_sheet.dart';
import '../../../components/custom_container.dart';
import '../../../components/divider.dart';
import '../../../theme/colors.dart';
import '../../../utils/shared_prefs.dart';
import '../../chat/chat_screen.dart';
import '../../order_place_screen/order_screen.dart';
import '../../painting_wall_screen/components/frequently_asked_questions_widget.dart';
import 'components/carousel_slider.dart';
import 'return_and_refund_screen.dart';

class ProductsDetailScreen extends StatefulWidget {
  const ProductsDetailScreen({super.key, this.detailId, this.typeId});
  final int? detailId;
  final int? typeId;

  @override
  State<ProductsDetailScreen> createState() => _ProductsDetailScreenState();
}

class _ProductsDetailScreenState extends State<ProductsDetailScreen> {
  final productsController = Get.put(ProductsController());
  bool isChecked = true;
  bool isLiked = false;
  bool isAdded = false;
  bool isLoading = false;
  final String urlToShare = 'https://flutter.dev';

  @override
  Widget build(BuildContext context) {
    productsController.fetchProductsDetails();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(title: appText('Product Details', fontSize: 18.sp, fontWeight: FontWeight.bold)),
      floatingActionButton: Transform.translate(
          offset: const Offset(0, -30),
          child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: AppColors.blackColor,
              onPressed: () {
                Get.to(() => const OrderPage());
              },
              child: Badge.count(count: 1, child: const Icon(Icons.shopping_cart, color: AppColors.whiteTheme)))),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Obx(() {
        if (productsController.isLoading.value) {
          return Center(child: showLoading());
        }
        final productDetail = productsController.productsDetailsModel.value;
        final List<String> bannerImages = productDetail?.bannerImages ?? [];
        final price = productDetail?.price ?? 0;
        final discountPercentage = int.tryParse(productDetail?.discount.toString() ?? '') ?? 0;

        final discountedPrice = price - (price * discountPercentage / 100);

        final List<String> descriptionImages = productDetail?.descriptionImages ?? [];

        if (productsController.productsDetailsModel.value == null) {
          return Center(child: appText('Nothing found!', fontSize: 16.sp));
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              ProductsCarouselSlider(height: 220.h, images: bannerImages),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: .38.sh,
                          child: appText(productDetail?.productName ?? '',
                              fontWeight: FontWeight.bold, fontSize: 18.sp, color: AppColors.redColor),
                        ),
                        appText(productDetail?.productCondition ?? '',
                            fontSize: 15.sp, color: AppColors.darkGreen, fontWeight: FontWeight.bold)
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SizedBox(width: width * 0.01),
                        appText(productDetail?.price.toString() ?? '',
                            decoration: TextDecoration.lineThrough, color: AppColors.greyColor),
                        const SizedBox(width: 10),
                        appText(discountedPrice.toString(), fontWeight: FontWeight.w700),
                        SizedBox(width: 10.w),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    appText(productDetail?.shortDescription ?? '', fontWeight: FontWeight.w400, fontSize: 14.sp),
                    SizedBox(height: 6.h),
                    appText("Warranty", fontWeight: FontWeight.bold, fontSize: 15.sp),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              showReviewsBottomSheet(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.star, color: AppColors.orangeColor, size: 20.sp),
                                appText("4.5 (42)"),
                              ],
                            )),
                        SizedBox(width: width * 0.02),
                        appText("200 sold", fontWeight: FontWeight.w400, fontSize: 16.sp),
                        const Spacer(),
                        CustomContainer(
                          height: 30.h,
                          borderRadius: 4.r,
                          color: AppColors.greenColor,
                          child: Padding(
                            padding: EdgeInsets.all(4.r),
                            child: Row(
                              children: [
                                Image.asset('assets/images/delivery.png', color: AppColors.whiteTheme, height: 26.h),
                                SizedBox(width: 4.w),
                                appText(productDetail?.deliveryCharges.toString() ?? "",
                                    color: AppColors.whiteTheme, fontWeight: FontWeight.bold)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        CustomContainer(
                          height: 30.h,
                          borderRadius: 4,
                          color: AppColors.redColor,
                          child: Padding(
                            padding: EdgeInsets.all(6.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                appText("${productDetail?.discount}% OFF" ?? "",
                                    color: AppColors.whiteTheme, fontWeight: FontWeight.bold)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.blueShade,
                          value: isChecked,
                          onChanged: (bool? value) {},
                        ),
                        appText("100% Authentic", fontWeight: FontWeight.w400, fontSize: 15.sp),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                            icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
                                color: isLiked ? AppColors.redColor : AppColors.blackColor)),
                        SizedBox(width: width * 0.02),
                        IconButton(
                            onPressed: () {
                              Share.share('Check out the Flutter website: $urlToShare');
                            },
                            icon: const Icon(
                              Icons.share,
                              color: AppColors.blueColor,
                            ))
                      ],
                    ),
                    SizedBox(height: 6.h),
                    const Divider(),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText('Shipping time & Return policy', fontSize: 16.sp, fontWeight: FontWeight.bold),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ReturnAndRefundScreen());
                          },
                          child: appText('Read More', color: AppColors.blueShade),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 0.32.sh,
                            child: appText("Estimated Delivery", fontSize: 15.sp, fontWeight: FontWeight.w400)),
                        SizedBox(
                            width: 80.w, child: Align(alignment: Alignment.bottomRight, child: appText('3 to 5 days')))
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Return Policy", fontSize: 15.sp, fontWeight: FontWeight.w400),
                        SizedBox(
                            width: 130.w,
                            child: appText(
                              "Contact our customer support team for help with your order.",
                            ))
                      ],
                    ),
                    SizedBox(height: 10.h),
                    const Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: appText("Product Details", fontWeight: FontWeight.w700, fontSize: 18)),
                        appText("Highlights", color: AppColors.darkGreen, fontSize: 17.sp, fontWeight: FontWeight.bold),
                        const SizedBox(height: 10),
                        ListView.builder(
                          itemCount: productDetail?.productHighlights?.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Icon(Icons.circle, size: 5.sp, color: AppColors.lightBlack),
                                const SizedBox(width: 8),
                                SizedBox(
                                    width: 300.w,
                                    child: appText(productDetail?.productHighlights?[index] ?? '', fontSize: 16.sp))
                              ],
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    div(),
                    SizedBox(height: 10.h),
                    appText("Description", fontWeight: FontWeight.bold, fontSize: 18),
                    SizedBox(height: 10.h),
                    ListView.builder(
                      itemCount: productDetail?.productDescription?.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Icon(Icons.check_circle, color: AppColors.greenColor, size: 20.sp),
                            SizedBox(width: 20.w),
                            SizedBox(
                                width: 300.w,
                                child: appText(productDetail?.productDescription.toString() ?? "", fontSize: 16.sp))
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
              ProductsCarouselSlider(
                height: 220.h,
                images: descriptionImages,
              ),
              SizedBox(height: 20.h),
              div(),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText('Top Selling', fontSize: 20, fontWeight: FontWeight.bold),
                    SizedBox(height: 10.h),
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
                                                spreadRadius: 2)
                                          ]),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.network('https://pngimg.com/d/air_conditioner_PNG24.png', height: 80.h),
                                        ],
                                      )),
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
                        )),
                    SizedBox(height: 20.h),
                    div(),
                    SizedBox(height: 20.h),
                    Obx(() {
                      final items = productsController.productsFaqs.value?.data;
                      if (productsController.isLoading.value) {
                        return Center(child: showLoading());
                      }
                      if (productsController.productsFaqs.value == null) {
                        return const SizedBox();
                      }
                      return ListView.builder(
                        itemCount: items?.faqs?.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final faq = productsController.productsFaqs.value?.data?.faqs?[index];
                          return Column(
                            children: [
                              FAQsComponent(
                                question: faq?.question,
                                answer: faq?.answer,
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      );
                    }),
                    SizedBox(
                      height: 100.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      bottomSheet: Container(
        height: 80.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.whiteTheme,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Chat Button
              GestureDetector(
                onTap: () {
                  Get.to(() => const ChatScreen());
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: AppColors.lowPurple.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.lowPurple, width: 2),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/chat.png', height: 20.h, color: AppColors.lowPurple),
                  ),
                ),
              ),

              // Add to Cart / View Cart Button
              CustomContainer(
                onTap: () async {
                  SharedPrefs prefs = SharedPrefs();
                  final userId = await prefs.getUserId();
                  final productId = productsController.productsDetailsModel.value?.productDetailId ?? 0;

                  if (userId == null) {
                    log('Error: User ID is null');
                    return;
                  }

                  // Check if the product is already in the cart
                  bool isProductInCart = await productsController.isProductInCart(productId);

                  if (isProductInCart) {
                    showInfoSnackbar(context, 'Item is already in the cart');
                    Get.to(() => const OrderPage());
                  } else {
                    await productsController.addProductToCart(context, userId, productId);
                    log('Added to cart: User ID: $userId, Product ID: $productId');

                    setState(() {
                      isAdded = true;
                    });
                  }
                },
                height: 40.h,
                width: 130.w,
                color: AppColors.transparentColor,
                borderColor: AppColors.blueShade,
                borderRadius: 8.r,
                child: Center(
                  child: Obx(() {
                    final productId = productsController.productsDetailsModel.value?.productDetailId ?? 0;
                    final isProductInCart =
                        productsController.viewCart.value?.data?.any((item) => item.id == productId) ?? false;

                    return appText(
                      isProductInCart ? "View Cart" : "Add to Cart",
                      fontWeight: FontWeight.bold,
                    );
                  }),
                ),
              ),

              // Buy Now Button
              CustomContainer(
                onTap: () {
                  productsController.fetchCartData();
                  Get.to(() => const OrderPage());
                },
                height: 40.h,
                width: 130.w,
                color: AppColors.blueColor,
                borderRadius: 8.r,
                child: Center(
                  child: appText('Buy now', color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
