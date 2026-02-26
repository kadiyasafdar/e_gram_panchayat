import 'dart:ui';
import 'package:e_gram_panchayat/app/utility/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// Toaster Message

enum ToastType { success, error, warning }

void toasterMessage(String message, {required ToastType type}) {
  Color color;
  IconData icon;

  switch (type) {
    case ToastType.success:
      color = success;
      icon = Icons.check_circle_rounded;
      break;
    case ToastType.error:
      color = error;
      icon = Icons.error_rounded;
      break;
    case ToastType.warning:
      color = Colors.orange;
      icon = Icons.warning_amber_rounded;
      break;
  }

  Get.showSnackbar(
    GetSnackBar(
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),

      // 🔥 Keep margin small
      margin: EdgeInsets.only(top: Get.height * 0.03, right: Get.width * 0.02),

      messageText: Align(
        alignment: Alignment.topRight,
        child: IntrinsicWidth(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Get.height / 54),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                constraints: BoxConstraints(maxWidth: Get.width * 0.5),
                padding: EdgeInsets.symmetric(
                  horizontal: Get.height / 42,
                  vertical: Get.height / 75.6,
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(Get.height / 54),
                  border: Border.all(
                    color: color.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: Colors.white, size: Get.height / 37.8),
                    SizedBox(width: Get.height / 75.6),
                    Flexible(
                      child: Text(
                        message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w600,
                          fontSize: Get.height / 47.25,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// Loader
appProgressBarIndicator() {
  Get.dialog(
    Stack(
      children: [
        Container(color: dark.withValues(alpha: 0.11)),
        Center(
          child: LoadingAnimationWidget.beat(
            color: primary,
            size: Get.height / 8.89,
          ),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
