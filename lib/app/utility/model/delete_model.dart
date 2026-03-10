import 'package:e_gram_panchayat/app/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void deletemodel() {
  Get.dialog(
    Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: tertiary,
          borderRadius: BorderRadius.circular(Get.height / 29.07),
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.height / 44.47),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Trash Icon
              Image.asset(
                'assets/images/trash_icon.png',
                height: Get.height / 12.81,
                width: Get.height / 12.81,
              ),

              SizedBox(height: Get.height / 58.15),

              // Title
              Text(
                'Confirm Delete?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: error,
                  fontSize: Get.height / 47.25,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Krub',
                ),
              ),

              SizedBox(height: Get.height / 58.15),

              // Description
              Text(
                'Are you sure you want to delete this record? This action cannot be undone.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkgray,
                  fontSize: Get.height / 54,
                  fontFamily: 'Krub',
                ),
              ),

              SizedBox(height: Get.height / 44.47),

              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: Get.height / 16.8,
                        decoration: BoxDecoration(
                          color: lightgray,
                          borderRadius: BorderRadius.circular(
                            Get.height / 47.25,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: dark,
                              fontSize: Get.height / 47.25,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Krub',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: Get.height / 37.8),

                  // Delete Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: Get.height / 16.8,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(
                            Get.height / 47.25,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: tertiary,
                              fontSize: Get.height / 47.25,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Krub',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
    barrierColor: dark.withValues(alpha: 0.8),
  );
}
