import 'dart:convert';
import 'package:e_gram_panchayat/app/utility/common_rest_api.dart';
import 'package:e_gram_panchayat/app/utility/environment.dart';
import 'package:e_gram_panchayat/app/utility/toster_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/theme.dart';

class HomeControler extends GetxController {
  var selectedType = 'Cash'.obs;

  void changeType(String type) {
    selectedType.value = type;
  }

  TextEditingController village = TextEditingController();
  TextEditingController taluka = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController descriptionOne = TextEditingController();
  TextEditingController descriptionTwo = TextEditingController();
  TextEditingController descriptionThree = TextEditingController();
  TextEditingController descriptionFour = TextEditingController();

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
    if (village.text.isEmpty) {
      villageError.value = "Enter your village name";
    } else {
      villageError.value = "";
    }

    if (taluka.text.isEmpty) {
      talukaError.value = "Enter your taluka name";
    } else {
      talukaError.value = "";
    }

    if (district.text.isEmpty) {
      districtError.value = "Enter your district name";
    } else {
      districtError.value = "";
    }

    if (descriptionOne.text.isEmpty) {
      descriptionOneError.value = "Enter description Price";
    } else {
      descriptionOneError.value = "";
    }

    if (descriptionTwo.text.isEmpty) {
      descriptionTwoError.value = "Enter description Price";
    } else {
      descriptionTwoError.value = "";
    }

    if (descriptionThree.text.isEmpty) {
      descriptionThreeError.value = "Enter description Price";
    } else {
      descriptionThreeError.value = "";
    }

    if (descriptionFour.text.isEmpty) {
      descriptionFourError.value = "Enter description Price";
    } else {
      descriptionFourError.value = "";
    }

    saveData();
  }

  Future<void> saveData() async {
    if (Get.isSnackbarOpen) return;

    try {
      // Show loader
      appProgressBarIndicator();

      // Params Pass For API
      var params = {
        'panchayat_name': village.text,
        'taluko': taluka.text,
        'district': district.text,
        'description_price_1': descriptionOne.text,
        'description_price_2': descriptionTwo.text,
        'description_price_3': descriptionThree.text,
        'description_price_4': descriptionFour.text,
        // 'cheque_no': chequeNo.text,
        // 'bank_name': bankName.text,
        // 'cheque_date': formattedDate.value,
      };

      // API Calling

      final response = await ApiServices.postPublicSingle(
        Environment.savaDataInvoice,
        params,
      );

      var responseData = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode == 200 && responseData['status'] == 'success') {
        // Clear Inputs Value
        _clearInputs();

        // Off Loader
        Get.back();

        // Toaster Message
        toasterMessage(responseData['message'], success);
      } else {
        // Off Loader
        Get.back();

        // Toaster Message
        toasterMessage(responseData['message'], error);
      }
    } catch (e) {
      // Off Loader
      Get.back();

      // Toaster Message
      toasterMessage('Something Want Wrong', error);
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
  }
}
