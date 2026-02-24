import 'package:e_gram_panchayat/app/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

appProgressBarIndicator() {
  Get.dialog(
    Stack(
      children: [
        Container(color: Colors.black),
        Center(child: LoadingAnimationWidget.waveDots(color: dark, size: 100)),
      ],
    ),
  );
}

toasterMessage(String message, Color color) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: color,
      margin: EdgeInsets.all(20),
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 3),
    ),
  );
}
