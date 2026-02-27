import 'dart:convert';
import 'package:e_gram_panchayat/app/history/history_screen.dart';
import 'package:e_gram_panchayat/app/utility/common_rest_api.dart';
import 'package:e_gram_panchayat/app/utility/environment.dart';
import 'package:e_gram_panchayat/app/utility/toster_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeControler extends GetxController {
  // Checkbox Variable
  RxBool cashCheckbox = false.obs;
  RxBool chequeCheckbox = false.obs;

  // Date Picker Variable
  var selectedDate = DateTime.now().obs;
  RxString formatedDate = ''.obs;
  RxString dateToSendToApi = ''.obs;

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
        formatedDate.value = DateFormat('dd-MM-yyyy').format(picked);
        formatedDate.value = DateFormat('dd-MM-yyyy').format(picked);
        dateToSendToApi.value = DateFormat('yyyy-MM-dd').format(picked);
      }
    } catch (e) {
      print(e);
    }
  }

  TextEditingController village = TextEditingController();
  TextEditingController taluka = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController descriptionOne = TextEditingController();
  TextEditingController descriptionTwo = TextEditingController();
  TextEditingController descriptionThree = TextEditingController();
  TextEditingController descriptionFour = TextEditingController();
  TextEditingController chequeNo = TextEditingController();
  TextEditingController bankName = TextEditingController();

  // Error Variables
  RxString villageError = "".obs;
  RxString talukaError = "".obs;
  RxString districtError = "".obs;
  RxString descriptionOneError = "".obs;
  RxString descriptionTwoError = "".obs;
  RxString descriptionThreeError = "".obs;
  RxString descriptionFourError = "".obs;

  void validatevillage(String value) {
    if (value.isEmpty) {
      villageError.value = "Enter your village name";
    } else {
      villageError.value = "";
    }
  }

  void validatetaluka(String value) {
    if (value.isEmpty) {
      talukaError.value = "Enter your valuka name";
    } else {
      talukaError.value = "";
    }
  }

  void validatedistrict(String value) {
    if (value.isEmpty) {
      districtError.value = "Enter your district name";
    } else {
      districtError.value = "";
    }
  }

  void validatedescriptionOne(String value) {
    if (value.isEmpty) {
      descriptionOneError.value = "Enter description Price";
    } else {
      descriptionOneError.value = "";
    }
  }

  void validatedescriptionTwo(String value) {
    if (value.isEmpty) {
      descriptionTwoError.value = "Enter description Price";
    } else {
      descriptionTwoError.value = "";
    }
  }

  void validatedescriptionThree(String value) {
    if (value.isEmpty) {
      descriptionThreeError.value = "Enter description Price";
    } else {
      descriptionThreeError.value = "";
    }
  }

  void validatedescriptionFour(String value) {
    if (value.isEmpty) {
      descriptionFourError.value = "Enter description Price";
    } else {
      descriptionFourError.value = "";
    }
  }

  void saveUserData() {
    if (village.text == '') {
      villageError.value = "villlage is required";
    }

    if (taluka.text == '') {
      talukaError.value = " taluka is required";
    }

    if (district.text == '') {
      districtError.value = "district is required";
    }

    if (descriptionOne.text == '') {
      descriptionOneError.value = "description is required";
    }

    if (descriptionTwo.text == '') {
      descriptionTwoError.value = "description is required";
    }

    if (descriptionThree.text == '') {
      descriptionThreeError.value = "description is required";
    }

    if (descriptionFour.text == '') {
      descriptionFourError.value = "description is required";
    }

    if (villageError.value == '' &&
        village.text.isNotEmpty &&
        talukaError.value == '' &&
        taluka.text.isNotEmpty &&
        districtError.value == '' &&
        district.text.isNotEmpty &&
        descriptionOneError.value == '' &&
        descriptionOne.text.isNotEmpty &&
        descriptionTwoError.value == '' &&
        descriptionTwo.text.isNotEmpty &&
        descriptionThreeError.value == '' &&
        descriptionThree.text.isNotEmpty &&
        descriptionFourError.value == '' &&
        descriptionFour.text.isNotEmpty) {
      // All validations passed, call the SaveData function

      saveData();
    }
  }

  Future<void> saveData() async {
    if (Get.isSnackbarOpen) return;

    try {
      // Show loader
      appProgressBarIndicator();
      // Determine the payment method
      String getPaymentMethod() {
        if (cashCheckbox.value) return 'cash';
        if (chequeCheckbox.value) return 'cheque';
        return ''; // Default empty value if none is selected
      }

      // Params Pass For API
      var params = {
        'panchayat_name': village.text,
        'taluko': taluka.text,
        'district': district.text,
        'description_price_1': descriptionOne.text,
        'description_price_2': descriptionTwo.text,
        'description_price_3': descriptionThree.text,
        'description_price_4': descriptionFour.text,
        'payment_method': getPaymentMethod(),
        'cheque_no': chequeNo.text,
        'bank_name': bankName.text,
        'cheque_date': formatedDate.value,
      };

      print(params);

      // API Calling

      final response = await ApiServices.postPublicSingle(
        Environment.savaDataInvoice,
        params,
      );

      print(response);

      var responseData = jsonDecode(response.body) as Map<String, dynamic>;
      print(responseData);

      if (response.statusCode == 200 && responseData['status'] == 'success') {
        // Clear Inputs Value
        _clearInputs();
        // Off Loader
        Get.back();

        // Toaster Message
        toasterMessage(responseData['message'], type: ToastType.success);
        Get.to(() => HistoryScreen());
      } else {
        // Off Loader
        Get.back();

        // Toaster Message
        toasterMessage(responseData['message'], type: ToastType.error);
      }
    } catch (e) {
      // Off Loader

      print(e);
      Get.back();

      // Toaster Message
      toasterMessage('something went wrong', type: ToastType.error);
      print('toasterMessage catch');
    }
  }

  void _clearInputs() {
    village.clear();
    taluka.clear();
    district.clear();
    descriptionOne.clear();
    descriptionTwo.clear();
    descriptionThree.clear();
    descriptionFour.clear();
    chequeNo.clear();
    bankName.clear();
  }
}
