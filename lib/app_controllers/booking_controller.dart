import 'package:get/get.dart';

class BookingController extends GetxController {
  var isBooking = true.obs;
  var isCompleted = false.obs;
  var isCancelled = false.obs;
  var isClaimed = false.obs;

  void selectStatus(String status) {
    isBooking.value = status == 'Bookings';
    isCompleted.value = status == 'Completed';
    isCancelled.value = status == 'Cancel';
    isClaimed.value = status == 'Warranty';
  }
}