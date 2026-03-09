import 'dart:convert';
import 'package:e_gram_panchayat/app/utility/common_rest_api.dart';
import 'package:e_gram_panchayat/app/utility/environment.dart';
import 'package:e_gram_panchayat/app/utility/toster_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  // Color Variable
  List<Color> colorList = [
    Color(0xffF2E3F3),
    Color(0xffEAEBDB),
    Color(0xffDFF3E3),
    Color(0xffE3F2FD),
    Color(0xffFDE2E4),
    Color(0xffFFF3CD),
    Color(0xffDFF6FF),
    Color(0xffE9D8FD),
  ];

  // History List Variable
  RxList<dynamic> historyList = [].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingPagination = false.obs;

  // Pagination Variable
  int currentPage = 1;

  // Count Variable
  RxInt getTotalCountInvoiceList = 0.obs;

  ScrollController scrollController = ScrollController();

  // Life cycle Method

  @override
  void onInit() {
    super.onInit();

    // History List Function
    getOrderListDataLatest();
  }

  // History Invoice List Latest Data API Function

  Future<void> getOrderListDataLatest() async {
    // Loader
    isLoading.value = true;

    try {
      var params = Map<String, dynamic>();

      params['sort_coloumn'] = 'created_at';
      params['sort_order'] = 'DESC';
      params['page'] = '1';
      params['limit_per_page'] = '25';

      // API Calling

      final response = await ApiServices.postPublicSingle(
        Environment.invoiceList,
        params,
      );

      // Response Save For API

      final responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['status'] == 'success') {
        // get count
        getTotalCountInvoiceList.value = responseData['data']['total'];

        print(getTotalCountInvoiceList);

        // API Data Save Variable
        List<dynamic> getInvoiceDataList = responseData['data']['data'] ?? [];

        if (getInvoiceDataList.isNotEmpty) {
          historyList.value = getInvoiceDataList;
        }

        print(historyList);

        // Loader
        isLoading.value = false;
      } else {
        // Loader
        isLoading.value = false;

        historyList.value = [];

        // Toaster Message
        toasterMessage(responseData['message'], type: ToastType.error);
      }
    } catch (e) {
      // Loader
      isLoading.value = false;

      historyList.value = [];

      // Toaster Message
      toasterMessage('Something Want Wrong', type: ToastType.error);
    }
  }
}
