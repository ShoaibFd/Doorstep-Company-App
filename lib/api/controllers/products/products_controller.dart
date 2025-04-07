// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:doorstep_company_app/components/custom_snackbar.dart';
import 'package:doorstep_company_app/utils/shared_prefs.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../screens/cart_screen/appointment_sheet.dart';
import '../../../screens/order_place_screen/shipping_address_summary.dart';
import '../../api_endpoints.dart';
import '../../models/products/checkout_address_model.dart';
import '../../models/products/products_details_model.dart';
import '../../models/products/products_faqs_model.dart';
import '../../models/products/products_filters_model.dart';
import '../../models/products/products_summary_model.dart';
import '../../models/products/products_types_model.dart';
import '../../models/products/view_cart_model.dart';

class ProductsController extends GetxController {
  var isLoading = false.obs;
  final SharedPrefs prefs = SharedPrefs();
  var productsTypeModel = Rxn<ProductsTypesModel>();
  var productsDetailsModel = Rxn<ProductsDetailsModel>();
  var productsFiltersModel = Rxn<ProductFiltersModel>();
  var productsSummaryModel = Rxn<ProductsSummaryModel>();
  var productsFaqs = Rxn<ProductsFAQsModel>();
  var viewCart = Rxn<ViewCartModel>();
  var checkoutAddress = Rxn<CheckoutAddressModel>();

  @override
  void onInit() {
    fetchProductsType();
    super.onInit();
  }

  Future<bool> isProductInCart(int productId) async {
    await fetchCartData();
    return viewCart.value?.data?.any((item) => item.productDetailId == productId) ?? false;
  }

  Future<ProductsTypesModel?> fetchProductsType() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(ApiEndpoints.productsType));
      log('Status code in Products: ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        productsTypeModel.value = ProductsTypesModel.fromJson(responseData);
        return productsTypeModel.value;
      } else {
        log('Failed to fetch Offers Products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching Offers Products: $e');
    } finally {
      isLoading.value = false;
    }
    return null;
  }

  // Products Type
  Future<ProductsDetailsModel?> fetchProductsDetails({int? typeId, var summaryId}) async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse('${ApiEndpoints.productsDetails}/$typeId/$summaryId'));
      log('Status code in Products details: ${response.statusCode}');
      log('Response in Products details: ${response.body}');
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        productsDetailsModel.value = ProductsDetailsModel.fromJson(responseData);
        return productsDetailsModel.value;
      } else {
        log('Failed to fetch Offers Products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching Offers Products: $e');
    } finally {
      isLoading.value = false;
    }
    return null;
  }

  // Products Categories
  Future<ProductFiltersModel?> fetchProductsFilters({int? typeId, int? sumId}) async {
    try {
      isLoading(true);
      productsFiltersModel.value = null;
      final response = await http.get(Uri.parse('${ApiEndpoints.productsFilters}/$typeId'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        productsFiltersModel.value = ProductFiltersModel.fromJson(responseData);
        return productsFiltersModel.value;
      } else {
        log('Something went wrong in fetchProductsFilters with ${response.statusCode}, Response: ${response.body}');
      }
    } catch (e) {
      log('Error in fetchProductsFilters actegories: $e');
    } finally {
      isLoading(false);
    }
    return null;
  }

// Product Summary function
  Future<ProductsSummaryModel?> fetchProductsSummary({int? typeId}) async {
    try {
      isLoading(true);

      // **Clear previous data before making API call**
      productsSummaryModel.value = null;
      log('typeId in productSummary: $typeId');
      final response = await http.get(Uri.parse("${ApiEndpoints.productsSummary}/$typeId"));
      log('Status code in products summary → ${response.statusCode}');
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData != null && responseData['data'] != null) {
          productsSummaryModel.value = ProductsSummaryModel.fromJson(responseData);
        } else {
          log('No data found for typeId: $typeId');
        }
        return productsSummaryModel.value;
      } else {
        log('Error occurred in ProductsSummary → ${response.statusCode} and ${response.body}');
      }
    } catch (e) {
      log('ERROR in ProductsSummary: $e');
    } finally {
      isLoading(false);
    }

    return null;
  }

// Frequently Asked question function
  Future<ProductsFAQsModel?> fetchProductsFaqs(int id) async {
    try {
      final response = await http.get(Uri.parse('${ApiEndpoints.productsFaqs}/$id'));
      if (response.statusCode == 200) {
        final respnseData = jsonDecode(response.body);
        productsFaqs.value = ProductsFAQsModel.fromJson(respnseData);
        return productsFaqs.value;
      } else {
        log('Error occured in Products FAQS: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      log('Error in Products FAQs: $e');
    }
    return null;
  }

// Add to cart function
  Future<void> addProductToCart(BuildContext context, int userId, int productId) async {
    try {
      isLoading(true);
      SharedPrefs prefs = SharedPrefs();
      final token = await prefs.getToken();
      final response = await http.post(
        Uri.parse(ApiEndpoints.addToCart),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'user_id': userId,
          'product_detail_id': productId,
        }),
      );

      log('Final Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        showSuccessSnackbar(context, 'Item added to cart successfully!');
      } else {}
    } catch (e) {
      log('Error occurred in addProductToCart: $e');
      showErrorSnackbar(context, 'Failed to add item to cart!');
    } finally {
      isLoading(false);
    }
  }

// View Cart Function
  Future<ViewCartModel?> fetchCartData() async {
    try {
      final token = await prefs.getToken();
      if (token == null) {
        log('Token not found');
        return null;
      }

      final response = await http.get(
        Uri.parse(ApiEndpoints.viewCart),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        viewCart.value = ViewCartModel.fromJson(responseData);
        return viewCart.value;
      } else {
        log('Failed to load cart: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      log('ERROR in view cart: $e');
    }
    return null;
  }

  Future<CheckoutAddressModel?> fetchCheckoutAddress(BuildContext context) async {
    try {
      isLoading(true);
      final token = await prefs.getToken();
      log('Token: $token');

      final response = await http.get(
        Uri.parse(ApiEndpoints.checkoutAddress),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      log('statusCode in address:${response.statusCode}, response: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        checkoutAddress.value = CheckoutAddressModel.fromJson(responseData);
      } else {
        showErrorSnackbar(context, 'Something went wrong, try again later.');
      }
    } catch (e) {
      log('Error: $e');
    } finally {
      isLoading.value = false;
    }
    return null;
  }

// Post Checkout Details
  Future<void> postCheckoutDetail({
    int? userId,
    List<int>? productId,
    List<int>? qty,
    int? totalItem,
    double? totalPrice,
    String? voucherCode,
    required BuildContext context,
    String? city,
    String? fullName,
    String? phone,
    String? shippingAddress,
    String? shippingAddress2,
  }) async {
    try {
      isLoading(true);
      final id = await prefs.getUserId();
      final body = jsonEncode({
        'user_id': id,
        'product_details_id': productId,
        'qty': qty,
        'total_items': totalItem,
        'total_price': totalPrice,
        'city': city,
        'full_name': fullName,
        'phone_number': phone,
        'shipping_address': shippingAddress,
        'shipping_address_2': shippingAddress2,
        'voucher_code': voucherCode,
      });

      log("User ID: $id");
      log("🔹 Request Body: $body");

      final response = await http.post(
        Uri.parse(ApiEndpoints.postCheckout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: body,
      );

      log("Status Code in PostCheckoutDetailsFunction: ${response.statusCode}");
      log("Response Body in PostCheckoutDetailsFunction: ${response.body}");

      if (response.statusCode == 201) {
        showSuccessSnackbar(context, 'Address saved successfully!');
        Get.to(() => const ShippingAddressSummaryScreen());
      } else {
        try {
          final responseData = jsonDecode(response.body);
          showErrorSnackbar(context, responseData['message'] ?? 'Unable to save address!');
        } catch (e) {
          log('🔹 JSON Decoding Error: $e');
          showErrorSnackbar(context, 'Invalid response from server!');
        }
      }
    } catch (e) {
      log('Error in postCheckout: $e');
      showErrorSnackbar(context, 'Something went wrong!');
    } finally {
      isLoading(false);
    }
  }

//Update Shipping Address Function
  Future<void> updateShippingAddress({
    required BuildContext context,
    required String addressType,
    required String area,
    required String streetName,
    required String appartment,
    required String city,
  }) async {
    try {
      isLoading(true);
      final id = await prefs.getUserId();

      final Map<String, dynamic> body = {
        'user_id': id, 
        'address_type': addressType,
        'area': area,
        'street_name': streetName,
        'apartment_or_villa': appartment,
        'secondary_city': city,
      };

      log("Sending Address Update: $body");

      final response = await http.post(
        Uri.parse(ApiEndpoints.postCheckout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      log("Status Code: ${response.statusCode}");
      log("Response Body: ${response.body}");

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        showSuccessSnackbar(context, 'Address saved successfully!');
        showAppointmentBottomSheet(context);
      } else {
        showErrorSnackbar(context, responseData['message'] ?? 'Unable to save address!');
      }
    } catch (e, stackTrace) {
      log("Error in updateShippingAddress: $e");
      log("Stack Trace: $stackTrace");
      showErrorSnackbar(context, 'Something went wrong!');
    } finally {
      isLoading(false);
    }
  }
}
