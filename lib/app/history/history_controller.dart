import 'dart:convert';
import 'package:e_gram_panchayat/app/utility/common_rest_api.dart';
import 'package:e_gram_panchayat/app/utility/environment.dart';
import 'package:e_gram_panchayat/app/utility/toster_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryController extends GetxController {
  // Date Picker Variable
  var selectedDate = DateTime.now().obs;
  RxString formattedDate = ''.obs;
  RxString dateToSendToApi = ''.obs;

  // Input Controllers
  TextEditingController invoiceNo = TextEditingController();

  // Download Invoice & Receipt Variable
  RxBool isDownloadingInvoice = false.obs;
  RxBool isDownloadingReceipt = false.obs;

  // History List Variable
  RxList<dynamic> historyList = [].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingPagination = false.obs;

  // Save Input Data Variable
  var invoiceNoSaveData = '';
  var invoiceDateSaveData = '';

  // Pagination Variable
  int currentPage = 1;

  // Count Variable
  RxInt getTotalCountInvoiceList = 0.obs;

  ScrollController scrollController = ScrollController();

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

  // Select Date Function

  void selectDate(BuildContext context) async {
    try {
      DateTime today = DateTime.now();
      DateTime lastDate = DateTime(today.year, today.month, today.day);

      // Ensure initialDate is not after lastDate
      DateTime initialDate = selectedDate.value.isAfter(lastDate)
          ? lastDate
          : selectedDate.value;

      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1990),
        lastDate: lastDate,
      );

      if (picked != null && picked != selectedDate.value) {
        selectedDate.value = picked;
        formattedDate.value = DateFormat('dd-MM-yyyy').format(picked);
        formattedDate.value = DateFormat('dd-MM-yyyy').format(picked);
        dateToSendToApi.value = DateFormat('yyyy-MM-dd').format(picked);
      }
    } catch (e) {
      print(e);
    }
  }

  // Life cycle Method

  @override
  void onInit() {
    super.onInit();

    scrollController.addListener(_scrollListner);

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
      // params['search_filed'] = dateToSendToApi.value;
      // params['invoice_number'] = invoiceNo.text;

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

        // Save Data Input
        // invoiceNoSaveData = invoiceNo.text;
        // invoiceDateSaveData = dateToSendToApi.value;

        // Clear Data Input Value
        // invoiceNo.clear();
        // formattedDate.value = '';

        // Loader
        isLoading.value = false;
      } else {
        // Loader
        isLoading.value = false;

        historyList.value = [];

        // Clear Data Input Value
        // invoiceNo.clear();
        // formattedDate.value = '';

        // Toaster Message
        toasterMessage(responseData['message'], type: ToastType.error);
      }
    } catch (e) {
      // Loader
      isLoading.value = false;

      // Clear Data Input Value
      // invoiceNo.clear();
      // formattedDate.value = '';

      historyList.value = [];

      // Toaster Message
      toasterMessage('Something Want Wrong', type: ToastType.error);
    }
  }

  // History Invoice List Pagination Data API Function

  Future<void> getInvoiceDataListPagination() async {
    if (Get.isSnackbarOpen || isLoadingPagination.value) return;

    isLoadingPagination.value = true;

    currentPage++;

    if (historyList.length < getTotalCountInvoiceList.value) {
      try {
        var params = Map<String, dynamic>();

        params['limit_per_page'] = '25';
        params['sort_coloumn'] = 'created_at';
        params['sort_order'] = 'DESC';
        params['page'] = currentPage.toString();
        params['search_filed'] = invoiceDateSaveData;
        params['invoice_number'] = invoiceNoSaveData;

        // API Calling

        final response = await ApiServices.postPublicSingle(
          Environment.invoiceList,
          params,
        );

        // Response Save For API

        final responseData = jsonDecode(response.body) as Map<String, dynamic>;
        if (response.statusCode == 200 && responseData['status'] == 'success') {
          // API Data Save Variable
          List<dynamic> getInvoiceDataList = responseData['data']['data'] ?? [];

          if (getInvoiceDataList.isNotEmpty) {
            // Add fetch data in list
            historyList.addAll(getInvoiceDataList);
          }

          // Loader
          isLoadingPagination.value = false;
        } else {
          // Loader
          isLoadingPagination.value = false;

          // Toaster Message
          toasterMessage(responseData['message'], type: ToastType.error);
        }
      } catch (e) {
        // Loader
        isLoadingPagination.value = false;
      }
    } else {
      isLoadingPagination.value = false;
    }
  }

  // Pagination Scroll Function

  void _scrollListner() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // Invoice Data List Pagination Function
      getInvoiceDataListPagination();
    }
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
